Rails.configuration.stripe = {
  :publishable_key => "pk_test_E2bnXMdsBwJq9msYABBBm4gh",
  :secret_key      => "sk_test_TRy1FRt6YBHDiPC5I7jV0EuX"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]