# iserv3-email-preview
This is my second version of [iserv-email-preview](https://github.com/WuerfelDev/iserv-email-preview), now with using Iserv3 API. Sadly Iserv GmbH has not published any documentation for their new API, so I got all the code through network capturing, webpage sourcecode and the Iserv3 app.


Usage
-----
Please read first the ReadMe in my [iserv-email-preview](https://github.com/WuerfelDev/iserv-email-preview). This version is similar im most points.



Differences
-----------
This file does not only show the eMail title but also the senders name and the date when the message was sent. The main variables have not changed, as you can see in the source. Notice that the URL which will be returned leads to the <i>old</i> email viewer.
To use the new one uncomment line 34 and comment instead line 33.
To have the output returned in a file, you need to swap the comment for line 48 and 49.

Why Iserv3
----------
Simply because it's the newest available Iserv version and ( correct me if i am wrong ) the only iserv under active development. It introduces an API which makes the access simple and brings an whole new user interface with mobile support and app. Iserv3 is additionally installed to iserv so you can use my both methodes :D
