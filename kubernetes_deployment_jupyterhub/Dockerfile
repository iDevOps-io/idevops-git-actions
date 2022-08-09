FROM jupyterhub/jupyterhub:latest
EXPOSE 8000
RUN useradd jupyterhub && \
    echo 'changeme123' | passwd jupyterhub
CMD ["jupyterhub"]
