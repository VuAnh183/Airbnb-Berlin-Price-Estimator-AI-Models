# Snowflake setup

## Authentication for Snowflake
To generate a key-pair for Snowflake authentication, run these following commands:

```sh
openssl genrsa 2048 | openssl pkcs8 -topk8 -v2 des3 -inform PEM -out rsa_key.p8 # Generate a private key
```

```sh
openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub # Generate a public key
```

## Database setup
Run the snowflake data import and user creation on Snowflake Worksheets, replacing `RSA_PUBLIC_KEY` with **your public key** 

## dbt-snowflake setup

Create a virtual environment and install dbt-snowflake:
```sh
virtualenv venv
. venv/bin/activate
python --version
pip install dbt-snowflake==1.10.2
dbt --version
```

Create a dbt project:
```sh
dbt init airbnb
```

After the dbt project is generated, you will have a file called `profile.yml` that looks something like this:

```sh
airbnb:
  outputs:
    dev:
      type: snowflake
      account: your-snowflake-account
      user: dbt

      role: TRANSFORM
      private_key: "[!! Change this to your own private key: !!]"
      private_key_passphrase: your-passphrase

      database: AIRBNB
      schema: DEV
      threads: 1
      warehouse: COMPUTE_WH
  target: dev
```

For the `account` field, the easiest way to get it is to take a look at your **Snowflake Registration email** and copy the string before `.snowflakecomputing.com`. 

P/s: After creating a Snowflake account, you will receive an email containing your `Username` and `Dedicated Login URL`