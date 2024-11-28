FROM bateau/openttd:latest AS base

RUN mkdir -p /home/openttd/.openttd

RUN ln -nfs /home/openttd/save /home/openttd/.openttd/save

# install curl
RUN apt-get update && apt-get install -y \
    curl \
    gettext

# copy shell scripts into image
COPY template_config.sh /template_config.sh
COPY entrypoint.sh /entrypoint.sh

# make shell scripts executable
RUN chmod +x /template_config.sh /entrypoint.sh

# set entrypoint.sh as the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
