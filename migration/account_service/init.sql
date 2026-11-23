CREATE TABLE IF NOT EXISTS account.bank_account (
    id             UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    account_holder VARCHAR(100)  NOT NULL,
    balance        NUMERIC(19,4) NOT NULL DEFAULT 0,
    currency       CHAR(3)       NOT NULL,          
    created_at     TIMESTAMPTZ   NOT NULL DEFAULT now(),
    updated_at     TIMESTAMPTZ   NOT NULL DEFAULT now(),

    CONSTRAINT bank_account_balance_non_negative CHECK (balance >= 0),
    CONSTRAINT bank_account_currency_iso         CHECK (currency ~ '^[A-Z]{3}$')
);

CREATE INDEX IF NOT EXISTS bank_account_account_holder_idx
    ON account.bank_account (account_holder);

CREATE TABLE IF NOT EXISTS account.transaction (
    id           UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    from_account UUID          NOT NULL,
    to_account   UUID          NOT NULL,
    amount       NUMERIC(19,4) NOT NULL,
    currency     CHAR(3)       NOT NULL,
    status       VARCHAR(20)   NOT NULL DEFAULT 'PENDING',
    created_at   TIMESTAMPTZ   NOT NULL DEFAULT now(),
    updated_at   TIMESTAMPTZ   NOT NULL DEFAULT now(),

    CONSTRAINT transaction_from_account_fk FOREIGN KEY (from_account)
        REFERENCES account.bank_account (id) ON DELETE RESTRICT,
    CONSTRAINT transaction_to_account_fk   FOREIGN KEY (to_account)
        REFERENCES account.bank_account (id) ON DELETE RESTRICT,

    CONSTRAINT transaction_amount_positive   CHECK (amount > 0),
    CONSTRAINT transaction_different_accounts CHECK (from_account <> to_account),
    CONSTRAINT transaction_currency_iso      CHECK (currency ~ '^[A-Z]{3}$'),
    CONSTRAINT transaction_status_valid      CHECK (status IN ('PENDING', 'COMPLETED', 'FAILED'))
);

CREATE INDEX IF NOT EXISTS transaction_from_account_created_at_idx
    ON account.transaction (from_account, created_at DESC);
CREATE INDEX IF NOT EXISTS transaction_to_account_created_at_idx
    ON account.transaction (to_account, created_at DESC);
CREATE INDEX IF NOT EXISTS transaction_pending_idx
    ON account.transaction (created_at)
    WHERE status = 'PENDING';
