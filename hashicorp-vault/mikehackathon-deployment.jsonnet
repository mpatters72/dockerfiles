{
  apiVersion: "extensions/v1beta1",
  kind: "Deployment",
  deploymentName:: "mikehackathon",
  version:: "mikehashivault:latest",
  appName:: "mikehashivault",
  metadata : {
    name: "mikehackathon"
  },
  spec: {
    replicas: 1,
    strategy: {
      type: "RollingUpdate",
      rollingUpdate: {
        maxUnavailable: 0
      }
    },
    template: {
      metadata: {
        labels: {
          app: $.deploymentName,
          dept: "DevOps",
          expiration: "20160518",
          launchedby: "Mike",
          owner: "Mike",
          role: "secretvault",
          ttl: "5760m"
        }
      },         
      spec: {
        containers: [
          {
            name: $.appName,
            image: "registry.dev.databricks.com/mpatters72/" + $.version,
            command: [
              "--port=8300:8300"
            ]
         }
        ]
     }      
  }
  
}
}