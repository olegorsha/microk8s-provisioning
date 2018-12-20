#/bin/bash
snap install microk8s --classic
snap alias microk8s.kubectl kubectl

mkdir ~/.kube
kubectl completion bash > ~/.kube/completion.bash.inc
echo "export PATH=$PATH:/snap/bin" >> ~/.bashrc
echo "source $HOME/.kube/completion.bash.inc" >> ~/.bashrc

