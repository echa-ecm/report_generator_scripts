# IUCLID Cloud (IDM) based setup of report generator script

## Background

When a IUCLD instance is hosted in the ECHA Cloud services, a slightly different bash script is required. Cloud instances depend on ECHA's account management (IDM). The script implements a mechanism to run in these instances but a with a couple of limitations:

* You need to locate the credentials to use in bash script
* The setup is only valid temporarily (~10 mins), the credentials provided to the script may expire in the middle of the execution of large batches of datasets and dossiers.

## Additional requirements

* An ECHA Cloud account with subscription to a IUCLID service, such as the full IUCLID Cloud service. This will provide you access to a dedicated IUCLID instance.
* The Cloud instance of IUCLID is up and running

## Setup of the script

Refer to main [README](../README.md)

## Customisation of the .env file for generation

The customisation of the .env file should follow the main [README](../README.md) file, but for the first step, i.e., the credentials to log in are set differently.

Instead of setting RF_USERNAME and RF_PASSWORD variables, you need to set up RF_TOKEN.

```
export RF_TOKEN=<IDM redeemed access token>
```

## Obtaining the IDM access token from the browser

1. Open your browser
1. Start the browser developer tools (Ctrl+Shift+I)
1. Access your ECHA account management page from the browser tab, aka [ULEM](https://ulem.echa.europa.eu/ui/dashboard)
1. In the developer tools select the Network tab
![Network tab in the browser developer tools](../doc/img/network-tab.png)
1. Click on the second "redeem" entry in the list to the left of the Network tab
![Redeem entries in the requests list](../doc/img/redeem-entries.png)
1. If the second 'Redeem' option does not appear, select 'All' next to the filter

![See second Redeem](../doc/img/developer_tools_screenshot_find_second_redeem_all.png)
1. Click on the Preview tab of the redeem entry
![Preview tab with access token](../doc/img/preview-tab.png)
1. Copy and paste the access content value to the RF_TOKEN entry in the .env file

## Run and generate the report

In the 'Git Bash' termninal, the refresh-and-generate.sh script needs to include a new flag, --idm, e.g.:

```
./refresh-and-generate.sh pcn_html_report.env --diff --idm
```

Remember that you need to update the .env file with a fresh IDM access token before running the script. It expires every 10 minutes approximately.
