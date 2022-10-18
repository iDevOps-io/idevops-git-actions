FROM jupyterhub/jupyterhub:latest
EXPOSE 8000
RUN useradd jupyterhub && \
    echo 'jupyterhub:changeme123' | chpasswd
CMD ["jupyterhub"]
