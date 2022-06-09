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
        -p 8443:8443
        -v /path/to/config:/etc/openfortivpn/config:ro \
        longjourney/openfortivpn-socks5
    ```

3. Now you can use SSL-VPN via `http://0.0.0.0:8443` or `socks5://0.0.0.0:8443`. You can also create an alias in your bashrc/zshrc:

    ```
    $ alias curlp='curl -x socks5://0.0.0.0:8443/'
    $ curlp http://example.com

    $ alias sshp='ssh -o ProxyCommand="nc -x 0.0.0.0:8443 %h %p"'
    $ sshp foo@example.com
    ```

## License

[MIT](https://github.com/Tosainu/docker-fortivpn-socks5/blob/master/LICENSE)
