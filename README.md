# Nautobot Docker Custom

This application is based off of the original nautobot-docker maintained by the nautobot community [nautobot Docker](https://github.com/nautobot/nautobot-docker-compose) but has several plugins installed.  The dockerfile uses the image as a base: [nautobot Dockerhub](https://hub.docker.com/r/networktocode/nautobot/tags).

The base container used derives from the original nautobot tags labeled with the most recent python version.  Ex: py3.11

## Installed plugins
- [social-auth-core](https://pypi.org/project/social-auth-core/)

## Running with Kubernetes
Sample kubernetes .yaml files have been included and below are explanations of each element yaml.  The following kubernetes examples assume using google workspace as the SSO/iDP provider.  Adapt as necessary per provider located here [Nautobot SSO SAML](https://docs.nautobot.com/projects/core/en/latest/user-guide/administration/configuration/authentication/sso/#saml-dependencies)

**deployment-example.yaml**
An example deployment.  List of required secrets:
- _nautobot-env_: Used for the following important passwords:
  - NAUTOBOT_DB_PASSWORD
  - NAUTOBOT_REDIS_PASSWORD
  - NAUTOBOT_SECRET_KEY
  - NAUTOBOT_SUPERUSER_API_TOKEN
  - NAUTOBOT_SUPERUSER_PASSWORD

**nautobot-config-configmap-example.yaml**
nautobot configuration for SSO SAML specific data.  In order for to use a SAML backend     SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https') must be set

**nautobot-env-configmap-example.yaml**
Nautobot general configuration for connectivity to databases and redis.  The example provided assumes running a postgres and redis database in cluster, however external databases can be used as well.

**nautobot-sso-saml2-configmap-example.yaml**
Required configmap to insert the XML data for the SAML data.  This is essentially the idP certificate in XML form.  Create this configmap from the certificate file.

**nautobot-nginx-config-example.yaml**
Nginx specific configuration to start nautobot web front end properly.  It is easier to create this directly from the .conf file

**nautobot-svc-example.yaml**
The Kubernetes service that allows connectivity to the nautobot container