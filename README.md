iOS-Wireless-Scanner-API
========================

## Notices

* Only works on jailbreaked iOS Devices 
* Can't be published in AppStore due to the usage of Private Libraries 
* Works perfectly on iOS 7.0+ ( Not tested on previous versions )

##Usage 

The API built on Signleton Pattern so you only need to import *Wireless.h* into your project 

To get all wireless signels in *NSArray*

```Objective-C
    [[WirelessAPI getSharedInstance]fatchWifiSignles]]
```

Or to get specific signel as *NSDictionary*
```Objective-C
    [[WirelessAPI getSharedInstance]networkInfo:@"11:22:33:44:55"]; /// Replace it with signel bssid
```

**Important !!** you need to put turnDown method under *applicationWillTerminate* in AppDelgate.m

```Objective-C
- (void)applicationWillTerminate:(UIApplication *)application
{
    [[WirelessAPI getSharedInstance]turnDown];

}
```

## Sample of returned information ( JSONed Version )


```JSON
{
  "0:19:70:86:83:65": {
    "AGE": 23752,
    "AP_MODE": 2,
    "BEACON_INT": 20,
    "BSSID": "0:19:70:86:83:65",
    "CAPABILITIES": 1057,
    "CHANNEL": 11,
    "CHANNEL_FLAGS": 8,
    "HT_CAPS_IE": {
      "AMPDU_PARAMS": 27,
      "ASEL_CAPS": 20780,
      "EXT_CAPS": 0,
      "MCS_SET": "ff000000 00000000 00000000 00000000",
      "TXBF_CAPS": 0
    },
    "HT_IE": {
      "HT_BASIC_MCS_SET": "00000000 00000000 00000000 00000000",
      "HT_DUAL_BEACON": 0,
      "HT_DUAL_CTS_PROT": 0,
      "HT_LSIG_TXOP_PROT_FULL": 0,
      "HT_NON_GF_STAS_PRESENT": 0,
      "HT_OBSS_NON_HT_STAS_PRESENT": 1,
      "HT_OP_MODE": 1,
      "HT_PCO_ACTIVE": 0,
      "HT_PCO_PHASE": 0,
      "HT_PRIMARY_CHAN": 11,
      "HT_PSMP_STAS_ONLY": 0,
      "HT_RIFS_MODE": 0,
      "HT_SECONDARY_BEACON": 0,
      "HT_SECONDARY_CHAN_OFFSET": 0,
      "HT_SERVICE_INT": 0,
      "HT_STA_CHAN_WIDTH": 0,
      "HT_TX_BURST_LIMIT": 1
    },
    "IE": "2d1a2c51 1bff0000 00000000 00000000 00000000 00000000 00000000 3d160b00 19000000 00000000 00000000 00000000 00000000 7f01017f 0101",
    "NOISE": "-92",
    "PHY_MODE": 16,
    "RATES": [
      1,
      2,
      5,
      11,
      6,
      9,
      12,
      18,
      24,
      36,
      48,
      54
    ],
    "RSSI": "-98",
    "SCAN_RESULT_FROM_PROBE_RSP": 0,
    "SNR": 3,
    "SSID": "4d722e43 6f6d7075 3213123 5f303739 1123322 3333111",
    "SSID_STR": "Test SSID"
  }
}
```

## To-Do List 

- [ ] Filtering API (Working On)
- [ ] Fully Functional App 


## Thanks 
Your Ideas , Collaborations , Code Review are highly welcomed and appreciated and again thanks for being awesome :) any question @mustafa96m on twitter







## License 
 The MIT License (MIT)
 
 Copyright (c) 2014 Mustafa Ahmed Abduljabbar
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
