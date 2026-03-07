# Troubleshooting

## Docker permission denied

Problem:
docker: permission denied while trying to connect to the Docker daemon socket

Cause:
User is not in the docker group.

Solution:
sudo usermod -aG docker ubuntu
Then logout and login again.

---

## Netdata dashboard not accessible

Problem:
Cannot access http://SERVER-IP:19999

Cause:
Firewall blocked the port.

Solution:
sudo ufw allow 19999

---

## Docker container not starting

Problem:
Container exited immediately.

Check logs:
docker logs container_name

Check container status:
docker ps -a