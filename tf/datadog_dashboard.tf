resource "datadog_dashboard" "aws_overview" {
  title       = "AWS Overview"
  description = "Dashboard con métricas clave de AWS EC2"
  layout_type = "ordered"

  widget {
    group_definition {
      title = "EC2 CPU Utilization"
      layout_type = "ordered"
      widget {
        timeseries_definition {
          title = "CPU Utilization"
          request {
            q = "avg:aws.ec2.cpuutilization{*} by {host}"
            display_type = "line"
          }
        }
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Network In"
      request {
        q = "avg:aws.ec2.network_in{*} by {host}"
        display_type = "line"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Network Out"
      request {
        q = "avg:aws.ec2.network_out{*} by {host}"
        display_type = "line"
      }
    }
  }
} 