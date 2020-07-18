# Block Setup

This block is designed to be used with Segment data collected through the client-side Javascript library, Analytics.js. After some quick setup you'll be able to attribute all conversions within a given lookback window using various out-of-the-box multi-touch attribution models, or your own custom model. You can also remove the lookback window completely to see all-time attribution for all conversions. The definition of which event counts as a conversion and which property counts as its value can be configured to point at any Segment event and event property.

1. Enter your Segment schema name, site domain, conversion event, and conversion value into the [manifest](/projects/attribution/files/manifest.lkml). Read the comments in that file for more detail about what to input there.
2. Update the logic for bucketing Sessions into Channels in the derived table in the [sessions view](/projects/attribution/files/views/sessions.view.lkml).
3. Adjust the session timeout period in the derived table in the [sessions view](/projects/attribution/files/views/sessions.view.lkml), the default is 30 minutes of inactivity to create a new session.
4. Add your own custom attribution models to the [conversion_attribution](/projects/attribution/files/views/conversion_attribution.view.lkml) view, the default models include first-touch, last-touch, linear, time-decay, and 40-20-40 (models explained in detail below).
5. Open the [Attribution dashboard](/dashboards/attribution::attribution_dash) to see your data populated and adjust the queries, visuals, and filters as you see fit.

## Notes about this block

This block is built for BigQuery but can be adjusted to work for other databases like Redshift, Snowflake, etc. The biggest change will be that other databases won't require de-duping in the `conversion_event`, `pages`, `tracks`, and `identifies` views. Also, you will need to adjust some of the functions used in the `sessions`, `events`, and `conversion_attribution` views.

This block is intentially kept simple, if you want more information about ID mapping, sessionization, or additional features like Funnels, check out the [Event Analytics by Segment block](https://looker.com/platform/blocks/source/event-analytics-by-segment).

## Attribution Models

The models we have included in this block include first-touch, last-touch, linear, time-decay, and 40-20-40. The calculation of each is explained below. For all models, they are dependent on the lookback window, so if the lookback window is set to 30 days, we only look back 30 days before the conversion for sessions that will be counted in the attribution model. If that lookback window is removed, then all sessions before the conversion will be counted.

### First-touch

The Channel of the first session within the attribution lookback window gets 100% credit for the conversion.

### Last-touch

The Channel of the last session within the attribution lookback window gets 100% credit for the conversion. This is equivalent to saying the session where the conversion happened gets 100% of the credit.

### Linear

Credit for the conversion is split evenly across all sessions that happened in the attribution lookback window. If there is only one session, it gets 100% credit, 2 sessions mean each get 50%, 4 means each gets 25%, etc.

### Time Decay

We are using this equation to calculate time-decay value for each session:

y = 2<sup>-x/7</sup>

In the formula, **x** is the number of days until the conversion happens and y is the credit given to the session. Adding up all the **y** values for a conversion won't app up to 1 conversion so we need to add up all **y** values, then for each session we calculate credit by dividing time decay credit for a given session by the sum of all session credit, for a conversion with 3 sessions it'd look like this to calculate credit for session 2:

y<sub>session 2</sub> / (y<sub>session 1</sub> + y<sub>session 2</sub> + y<sub>session 3</sub>)


### 40-20-40

The first session in the attribution lookback window gets 40% of the credit, the conversion session gets 40% of the credit and the remaining 20% credit gets divided across all other sessions. If there are 2 sessions, each get 50% credit.

You can see the screenshots of the explore and default dashboard in the [Looker blocks directory](https://looker.com/platform/blocks/source/multi-touch-attribution-by-segment).
