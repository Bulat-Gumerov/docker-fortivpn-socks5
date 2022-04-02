# docker-fortivpn-socks5 ![](https://https://github.com/Tosainu/docker-fortivpn-socks5/workflows/Build/badge.svg)

Connect to a Fortinet SSL-VPN via http/socks5 proxy.

## Usage

1. Create an openfortivpn configuration file.

    ```
    $ cat /path/to/config
    host = vpn.example.com
    port = 443
    username = foo
    password = bar
    ```

2. Run the following command to start the container.

    ```
    $ docker container run \
        --privileged
        --rm \
        -v /path/to/config:/etc/openfortivpn/config:ro \
        longjourney/openfortivpn-socks5
    ```

3. Now you can use SSL-VPN via `http://<container-ip>:8443` or `socks5://<container-ip>:8443`.

    ```
    $ http_proxy=http://172.17.0.2:8443 curl http://example.com

    $ ssh -o ProxyCommand="nc -x 172.17.0.2:8443 %h %p" foo@example.com
    ```

## License

[MIT](https://github.com/Tosainu/docker-fortivpn-socks5/blob/master/LICENSE)
