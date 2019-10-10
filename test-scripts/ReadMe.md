Test Scripts:

test-deployments:

 Step 1: Run kubectl via docker container in order to use that config file
 Step 2: Run kubectl get deployments to list your deployments and output that to a file called dep.txt as well as to console
 Step 3: Check that you have seven lines in your file, as you should have 7 6 deployments and an additonal liner with headers
 Step 4: If 7 lines returned from the file, success. If not, fail the pipeline with error code 127.

test-eks-cluster-nonprod & test-eks-cluster-prod:
Step 1: Run kubectl describe-repositories command to list your repositories and output to a file called rop.txt
Step 2: Check whether the server has been created by grepping for Server in the file
Step 3: If server not found, then fail the pipeline with code 100. If success, complete the piepline.


test-images:
Step 1: Run kubectl describe-repositories command to list your repositories and output to a file called rop.txt
Step 2: File should find 6 entries, one for each repository created for our images.
Step 3: If repositories found, success. If 6 not found, fail pipeline with error code 127.

test-lb:
Step 1: Run kubectl via docker container in order to use that config file
Step 2: Run get svc to
Step 3: Check whether the load balancer has been created by grepping for LoadBalancer in the file
Step 4: If found, pass the test. If not found, exit with code 127 and fail the pipeline.
