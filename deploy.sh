docker build -t johnlorac/multi-client -f ./client/Dockerfile ./client
docker build -t johnlorac/mutli-server -f ./server/Dockerfile ./server
docker build -t johnlorac/multi-worker -f ./worker/Dockerfile ./worker
docker push johnlorac/multi-client
docker push johnlorac/multi-server
docker push johnlorac/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=johnlorac/multi-server
