#!/bin/bash

ANT_OPTS="-Xms512m -Xmx786m -XX:MaxPermSize=786m" ant $1
