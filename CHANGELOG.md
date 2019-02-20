## 0.1.6 (2019-02-20)
Changes:

 - Updating HTTPS request options for Ellucian TLS changes.

## 0.1.5 (2017-08-15)
Changes:

  - Reverting to block-style downloads and just passing the cipher to HTTP.start. (Should have RTFM, jumped the gun on v0.1.4.)

## 0.1.4 (2017-08-15)
Changes:

  - Defaulted to AES128-SHA cipher, since HTTPS to esmsvc.ellucian.com fails on OpenSSL 1.0.2k due to small DH keysize of server.
  - Fix case of "null" file download for releases w/out document or install metadata artifacts.

## 0.1.3 (2017-03-10)
Changes:

  - bumped default esmversion to 1.8

## 0.1.2 (2016-11-28)
Changes:

 - fixed multi-get's release info to get correct url path
 - yanked gem version 0.1.1

## 0.1.1 (2016-11-23)
Changes:

 - allow `get`'s `--name` to take a release list for multi-release d/l.

## 0.1.0 (2016-07-29)

Initial release.
