# Etapa de build
FROM quay.io/keycloak/keycloak:26.2.0 as builder
WORKDIR /opt/keycloak
ENV KC_HOSTNAME_STRICT=false
RUN /opt/keycloak/bin/kc.sh build

# Etapa final
FROM quay.io/keycloak/keycloak:26.2.0
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak
ENV KC_HOSTNAME_STRICT=false
EXPOSE 8080
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--http-port=8080"]
