# rabbitmq-stomp-insecure

This docker image will start up a rabbitmq instance with stomp,
web_stomp, and management plugins enabled.

It will also create a new "fullaccess" user ("fullaccess") password that
will have... well full access.

Use at your own peril.

# building

1. Download https://dl.bintray.com/rabbitmq/community-plugins/3.7.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip
2. Unzip rabbitmq_delayed_message_exchange-20171201-3.7.x.zip
3. Run `docker build -t .`
