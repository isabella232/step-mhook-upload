# Mhook upload

## Example

```
deploy:
    steps:
        - mhook-upload:
            bucket: wercker-development
            upload-prefix: bin/
            use-latest: true
            key-id: $AWS_KEY_ID
            key-secret: $AWS_SECRET_KEY
```
