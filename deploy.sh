docker build -t johnlorac/multi-client:latest -t johnlorac/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t johnlorac/mutli-server:latest -t johnlorac/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t johnlorac/multi-worker:latest -t johnlorac/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push johnlorac/multi-client:latest
docker push johnlorac/multi-server:latest
docker push johnlorac/multi-worker:latest

docker push johnlorac/multi-client:$SHA
docker push johnlorac/multi-server:$SHA
docker push johnlorac/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=johnlorac/multi-server:$SHA
kubectl set image deployments/client-deployment client=johnlorac/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=johnlorac/multi-worker:$SHA
