#!/bin/bash
# Version 1.1 - (c) Eliyah Havemann 2018 
function WHOA {
printf "+OK Sysuser: $(whoami) You: $(echo ${USER:5} | sed 's/[^0-9,a-z,A-Z]*//g') From: ${REMOTE_HOST}\r\n"
#printf "+OK Sysuser: $(whoami) You: ${USER:5} From: ${REMOTE_HOST}\r\n"
#printf "+OK Sysuser: $(whoami) \r\n"
}
function APOP {
printf "+OK Mailbox ready\r\n"
}
function RSET {
printf "+OK\r\n"
DELETE=0
}
function NOOP {
printf "+OK\r\n"
}
function STAT {
printf "+OK 1 1423\r\n"
}
function UIDL {
if [ $DELETE -eq 0 ]; then
 if [ -z ${INPUT:5:1} ]; then
  printf "+OK list follows\r\n1 1498464919.H758444P23943.l7tt.allot.com\r\n.\r\n"
 else
  if [ ${INPUT:5:1} -eq 1 ]; then
   printf "+OK 1 1498464919.H758444P23943.l7tt.allot.com\r\n"
  else
   printf "\x2dERR Message ${INPUT:5:1} doesn't exist\r\n"
  fi
 fi
 else
 if [ -z ${INPUT:5:1} ]; then
  printf "+OK list follows\r\n.\r\n"
 else
   printf "\x2dERR Message ${INPUT:5:1} doesn't exist\r\n"
 fi
fi
}
function DELE {
if [ -z ${INPUT:5:1} ]; then
 ERR
else
 if [ ${INPUT:5:1} -eq 1 ]; then
  printf "+OK Message 1 deleted\r\n"
  DELETE=1
 else
  printf "\x2dERR Message ${INPUT:5:1} doesn't exist\r\n"
 fi
fi
}
function LIST {
if [ $DELETE -eq 0 ]; then
 if [ -z ${INPUT:5:1} ]; then
  printf "+OK POP3 clients that break here, they violate STD53.\r\n1 1423\r\n.\r\n"
 else
  if [ ${INPUT:5:1} -eq 1 ]; then
   printf "+OK 1 1423\r\n"
  else
   printf "\x2dERR Message ${INPUT:5:1} doesn't exist\r\n"
  fi
 fi
 else
 if [ -z ${INPUT:5:1} ]; then
  printf "+OK POP3 clients that break here, they violate STD53.\r\n.\r\n"
 else
   printf "\x2dERR Message ${INPUT:5:1} doesn't exist\r\n"
 fi
fi
}
function EICAR {
printf "+OK 1423 octets follow.\r
Received: from mail by fake.server.email.com with spam-scanned (Exim 4.80)\r
	(envelope-from <fake.sender@fake.server.email.com>)\r
	id 1dPONf-0004WV-S7\r
	for receipient@other.fake.com; Mon, 26 Jun 2017 09:24:20 +0200\r
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on fake.server.email.com\r
X-Spam-Level: \r
X-Spam-Status: No, score=-1.0 required=4.8 tests=ALL_TRUSTED,BAYES_20,\r
	TVD_SPACE_RATIO autolearn=ham version=3.3.2\r
Received: from localhost ([::1] helo=localhost)\r
	by fake.server.email.com with esmtp (Exim 4.80)\r
	(envelope-from <fake.sender@fake.server.email.com>)\r
	id 1dPONf-0004WP-Op\r
	for ipient@other.fake.com, 26 Jun 2017 09:24:19 +0200\r
MIME-Version: 1.0\r
Content-Type: multipart/mixed;\r
 boundary=\x22=_513bf77f49db82e0410afd4f37ce5079\x22\r
Date: Mon, 26 Jun 2017 10:24:19 +0300\r
From: Allot Test <fake.sender@fake.server.email.com>\r
To: receipient@other.fake.com\r
Subject: EICAR\r
Message-ID: <92d7acf1786317e7e356874e19095460@mitnadev.de>\r
X-Sender: fake.sender@fake.server.email.com\r
User-Agent: Roundcube Webmail/1.1.2\r
\r
--=_513bf77f49db82e0410afd4f37ce5079\r
Content-Transfer-Encoding: 7bit\r
Content-Type: text/plain; charset=US-ASCII;\r
 format=flowed\r
\r
Attached eicar virus\r
--=_513bf77f49db82e0410afd4f37ce5079\r
Content-Transfer-Encoding: base64\r
Content-Type: application/x-msdownload;\r
 name=eicar.exe\r
Content-Disposition: attachment;\r
 filename=eicar.exe;\r
 size=69\r
\r
WDVPIVAlQEFQWzRcUFpYNTQoUF4pN0NDKTd9JEVJQ0FSLVNUQU5EQVJELUFOVElWSVJVUy1URVNU\r
LUZJTEUhJEgrSCoK\r
--=_513bf77f49db82e0410afd4f37ce5079--\r
\r
\x0d\x0a.\x0d\x0a"
}
function RETR {
if [ -z ${INPUT:5:1} ]; then
  ERR
else
 if [ $DELETE -eq 0 ]; then
  if [ ${INPUT:5:1} -eq 1 ]; then
   if [ ${USER:5:5} = "eicar" ]; then
    EICAR
   else
    printf "+OK 1423 octets follow.\r
Received: from mail by fake.server.email.com with spam-scanned (Exim 4.80)\r
	(envelope-from <fake.sender@fake.server.email.com>)\r
	id 1dPONf-0004WV-S7\r
	for receipient@other.fake.com; Mon, 26 Jun 2017 09:24:20 +0200\r
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on fake.server.email.com\r
X-Spam-Level: \r
X-Spam-Status: No, score=-1.0 required=4.8 tests=ALL_TRUSTED,BAYES_20,\r
	TVD_SPACE_RATIO autolearn=ham version=3.3.2\r
Received: from localhost ([::1] helo=localhost)\r
	by fake.server.email.com with esmtp (Exim 4.80)\r
	(envelope-from <fake.sender@fake.server.email.com>)\r
	id 1dPONf-0004WP-Op\r
	for ipient@other.fake.com, 26 Jun 2017 09:24:19 +0200\r
MIME-Version: 1.0\r
Content-Type: multipart/mixed;\r
 boundary=\x22=_513bf77f49db82e0410afd4f37ce5079\x22\r
Date: Mon, 26 Jun 2017 10:24:19 +0300\r
From: Allot Test <fake.sender@fake.server.email.com>\r
To: receipient@other.fake.com\r
Subject: EUCAR\r
Message-ID: <92d7acf1786317e7e356874e19095460@mitnadev.de>\r
X-Sender: fake.sender@fake.server.email.com\r
User-Agent: Roundcube Webmail/1.1.2\r
\r
--=_513bf77f49db82e0410afd4f37ce5079\r
Content-Transfer-Encoding: 7bit\r
Content-Type: text/plain; charset=US-ASCII;\r
 format=flowed\r
\r
No attached virus\r
--=_513bf77f49db82e0410afd4f37ce5079\r
Content-Transfer-Encoding: base64\r
Content-Type: text/plain;\r
 name=eucar.exe\r
Content-Disposition: attachment;\r
 filename=eucar.exe;\r
 size=69\r
\r
WDZPIVAlQEFQWzRcUFpYNTQoUF4pN0NDKTd9JEVVQ0FSLVNUQU5EQVJELUFOVElWSVJVUy1URVNU\r
LUZJTEUhJEgrSCoK\r
--=_513bf77f49db82e0410afd4f37ce5079--\r
\r
\x0d\x0a.\x0d\x0a"
   fi
  else
   printf "\x2dERR Message ${INPUT:5:1} doesn't exist\r\n"
  fi
 else
  printf "\x2dERR Message ${INPUT:5:1} doesn't exist\r\n"
 fi
fi
}
function ERR {
printf "\x2dERR Invalid command.\r\n"
}
function CAPA {
printf "+OK Here's what I can do:\r\nUSER\r\nUIDL\r\nDELE\r\nSTAT\r\nRSET\r\nAPOP\r\nIMPLEMENTATION FakePOP3 by Eliyah Havemann\r\n.\r\n"
}
function QUIT {
printf "+OK Bye-bye\r\n"
exit 0 
}
DELETE=0
printf "+OK Hello there. Dummy POP3 only.\r\n"
read -t 10 -e -p "" USER || printf "\x2dERR Timeout.\r\n"
if [ ${#USER} -eq 0 ]; then
  exit 0
fi
if [ ${USER:0:4} == "CAPA" ]; then
   CAPA
   read -t 10 -e -p "" USER || printf "\x2dERR Timeout.\r\n"
   if [ ${#USER} -eq 0 ]; then
     exit 0
   fi
fi
if [ ${USER:0:4} != "USER" ]; then
   ERR
   exit 0
fi
if [ -z ${USER:5} ]; then
  ERR
  exit 0
fi
printf "+OK Password required.\r\n"
read -t 20 -e -p "" PASS || printf "\x2dERR Timeout.\r\n"
if [ ${#PASS} -eq 0 ]; then
  exit 0
fi
if [ -z ${PASS:5} ]; then
  printf "\x2dERR Password required.\r\n"
  exit 0
fi
if [ ${PASS:0:4} != "PASS" ]; then
  ERR
  exit 0
else
  printf "+OK logged in.\r\n"
  logger -p mail.info "FakePOP3d - IP: ${REMOTE_HOST} - User $(echo ${USER:5} | sed 's/[^0-9,a-z,A-Z]*//g') logged in"
fi

while true; do
TIMO=0
read -t 20 -e -p "" INPUT || TIMO=1
if [ $TIMO -eq 1 ]; then
  printf "\x2dERR Timeout.\r\n"
  exit 0
fi
$( echo ${INPUT:0:4} | tr '[:lower:]' '[:upper:]' ) 2>/dev/null || ERR
done

