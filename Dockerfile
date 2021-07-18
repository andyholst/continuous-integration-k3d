FROM rancher/k3d:v4.4.6-dind

RUN curl -fsSL -o /get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
RUN chmod 700 /get_helm.sh
RUN /get_helm.sh && rm /get_helm.sh
COPY ./initiate_k8_cluster_and_ci_platform.sh /initiate_k8_cluster_and_ci_platform.sh
COPY deployment /deployment

CMD ["bash", "-c", "/initiate_k8_cluster_and_ci_platform.sh"]