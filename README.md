# esmdl

esmdl is a Ruby gem that provides a command line interface that replicates (some of) the release download functionality of Ellucian Solutions Manager. It is not authored or supported by Ellucian and does not provide any of the installation of provisioning functionality of ESM.

It is intended to be used by licensed ellucian customers to download available releases without requiring the installation of ESM.

## Installation

Install is simply:    

```
$ gem install esmdl
```

## Configuration

The only required configuration parameters are the `username` and `password` of an Ellucian Download Center account. This can either be supplied in the file `~/.esmdl`:
```yaml
username: "myusername"
password: "!s3cr3t*"
```
or via the command line arguments `--username` and `--password`. The other available configuration values are `esmversion` (defaults to 1.7), `stage_dir` (defaults to './'), and `base_url`. Command line parameters override any parameters from `~/.esmdl`.

## Usage
Downloading a release, associated documentation, and ESM installation metadata:
```
$ esmdl get --name=general-admin-9020020u.trz --docs --metadata
Starting download of general-admin-9020020u.trz...done! (201.44 MiB)
Starting download of general-admin-9020020d.trz...done! (1.35 MiB)
Starting download of general-admin-9020020u.zip...done! (2.66 KiB)
```

Finding available releases is done through the `list` subcommand.

Listing available licensed products:
```
$ esmdl list products
BMUI: BMUI Banner Multi Upgrade Installer
BNR_ADMCOM: Banner Admin Common
BNR_ADV: Banner Advancement
...
```

Filtering that list:
```
$ esmdl list products --filter=student
BNR_STU: Banner Student
BNR_STUSS: Banner Student Self-Service
BXE_ETRANS: Banner Student eTranscript
...
```

Listing available releases for a given product:
```
$ esmdl list releases --product=BNR_STU
Banner Student Upgrade 8.5.5 (stu80505u.trz) - BNR_STU -2012-11-15
Banner Student Upgrade 8.5.6 (stu80506u.trz) - BNR_STU -2013-02-15
Banner Student Upgrade 8.5.7 (stu80507u.trz) - BNR_STU -2013-05-31
...
```

Or by filter:
```
$ esmdl list releases --filter=admin
Banner Admin Document Management 9.2.0.18 (extsol-admin-9020018u.trz) - BNR_DMS -2016-03-14
Banner Admin Finance 9.2.0.18 (finance-admin-9020018u.trz) - BNR_FIN -2016-03-14
Banner Admin Position Control 9.2.0.18 (posnctl-admin-9020018u.trz) - BNR_POSCTL -2016-03-14
Banner Admin Human Resources 9.2.0.18 (payroll-admin-9020018u.trz) - BNR_HRPAY -2016-03-15
...
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ian-d/esmdl.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
