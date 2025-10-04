---
version: 1.0.0
last_updated: 2025-09-14
author: Evgenii Zabotkin
---

# Custom Alerts

## Introduction

The **Custom Alerts** feature allows you to set the alerts that will notify you when **CPU**, **Memory**, or **Network** usage exceeds the threshold you set on the Cloud Dashboard.

> **Who is this for?**
> 
> The feature is aimed at both beginners and advanced System Administrators.

## Prerequisites

- Access to the Dashboard and a role with the permissions required to create alerts.
- At least one monitored resource (server/VM/container) reporting metrics.

## Creating Your First Alert (CPU)

To create your first alert:

1. Go to **Monitoring** → **Alerts** → **Custom Alerts**, then click **New Alert**:

    [screenshot or GIF]

2. Select **CPU Usage** from the **Metric** dropdown:

    [screenshot or GIF]

3. In the **Condition** section:

   1. Set **Threshold** to **>85%**.

      [screenshot or GIF]

      > **NOTE**
      > 
      > The provided value is a recommended value that ensures effective alert usage.
    
   2. Set **Evaluation Window** to **5 minutes**.

      [screenshot or GIF]

      > **NOTE**
      >
      > The provided value is a recommended value that ensures effective alert usage.
    
4. In the **Scope** dropdown, set **All resources** to receive alerts for all monitored resources, or select a specific one you'd like to receive alerts for:

   [screenshot or GIF]

5. In the **Notifications** section select **Email** from the dropdown and enter recipients' email addresses:

   [screenshot or GIF]

6. Enter the alert name in the **Alert Name** field.
7. Click **Create**.

Now your alert will trigger, if 85% of the CPU capacity remains in use for 5 or more minutes.

>  **NOTE**
> 
> After you create the alert, a test notification will be sent to the recipients' Email specified in the **Notifications** section to ensure that alerts are delivered correctly.

> **Also try:**
> 
> Create similar alerts for Memory usage (e.g., > 80% for 10m) and Network throughput (e.g., > 1 Gbps for 5m).

## Advanced Configuration

For larger environments, reduce noise and increase relevance using these options:

- **Scoped alerts by tags/labels**
  
   Limit an alert to production only (e.g., `env=prod`) or a specific team/service (e.g., `service=payments`). Navigate to Scope or Filters and add tag-based criteria.
  
- **Composite conditions**

   Combine multiple metrics in one rule, such as:

   **CPU > 85% AND Memory > 80% for 5 minutes.** 

   This cuts false positives when a single metric briefly spikes.

> TIP 
> 
> When needed, set Severity (e.g., Warning vs Critical) and map to different notification channels.

## Troubleshooting

- **No alerts firing?** Lower the threshold or shorten the window to test.
- **Too many alerts?** Increase the window or narrow the scope with tags/labels.
- **No email received?** Check recipients, spam, and notification channel settings.
