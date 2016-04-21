FROM ubuntu:trusty
MAINTAINER laztrav


RUN apt-get update -qq && apt-get install -y ruby-full
   
RUN apt-get install -y git
RUN cd /opt && git clone https://github.com/laztrav/fake_sqs.git

RUN	cd /opt/fake_sqs && gem build fake_sqs.gemspec && gem install fake_sqs

RUN mkdir -p /srv/fake-sqs

EXPOSE 4568

CMD ["fake_sqs",  "--database" , "/srv/fake-sqs/database.yml"]
