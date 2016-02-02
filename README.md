# Mhook upload

## Example

```
deploy:
    steps:
        - mhook-upload:
            bucket: wercker-development
            upload-prefix: bin/
            use-latest: true
```
