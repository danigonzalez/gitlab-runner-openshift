Openshift templates
-------------------

Here you can find two templates. One is for deploy minio (S3 Storage
Compatible) and the other one for deploy gitlab runner. If you are going to
deploy a gitlab runner with cache, you must first deploy minio to get the
credentials for gitlab.

These templates are not meant to fit everywhere but you can base your
deployment on it. There is an script called `deploy_gitlab_instance.sh` that
can be helpful if you are setting multiple gitlab instances with different
resources for example. Patches are always welcomed!
