-- Add missing litellm_token column to api_keys table (idempotent for fresh installs)

ALTER TABLE public.api_keys
ADD COLUMN IF NOT EXISTS litellm_token text;
