FROM rabbitmq:3.7

ADD *.ez /opt/rabbitmq/plugins


RUN rabbitmq-plugins enable --offline rabbitmq_management
RUN rabbitmq-plugins enable --offline rabbitmq_stomp
RUN rabbitmq-plugins enable --offline rabbitmq_web_stomp
RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange 

EXPOSE 15671 15672 15674 61613

WORKDIR /tmp

RUN echo "rabbitmq-server &" >> startup.sh
RUN echo "export RABBITMQ_SERVER_PID=$!" >> startup.sh
RUN echo "sleep 10" >> startup.sh
RUN echo "rabbitmqctl add_user fullaccess fullaccess" >> startup.sh
RUN echo "rabbitmqctl set_user_tags fullaccess administrator" >> startup.sh
RUN echo "rabbitmqctl set_permissions -p / fullaccess \".*\" \".*\" \".*\"" >> startup.sh
RUN echo "wait $RABBITMQ_SERVER_PID" >> startup.sh
RUN echo "rabbitmq-plugins enable rabbitmq_consistent_hash_exchange" >> startup.sh
RUN echo "rabbitmq-plugins enable rabbitmq_delayed_message_exchange" >> startup.sh

RUN chmod +x /tmp/startup.sh

ENTRYPOINT /tmp/startup.sh
