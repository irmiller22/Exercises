# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Auth::Application.config.secret_key_base = '81136d6d45bbc4337db391b0c336d207cfb223fae30954c5165e247e2c391a7b4d20b453466a665eceb134282a67c896d1105a1a0beedf71090ab1305564fb23'
