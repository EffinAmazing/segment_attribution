# Block Setup

This block is designed to be used with Segment data collected through the client-side Javascript library, Analytics.js. After some quick setup you'll be able to attribute all conversions within a given lookback window using various out-of-the-box multi-touch attribution models, or your own custom model. You can also remove the lookback window completely to see all-time attribution for all conversions. The definition of which event counts as a conversion and which property counts as its value can be configured to point at any Segment event and event property.

1. Enter your Segment schema name, site domain, conversion event, and conversion value into the [manifest](/projects/attribution/files/manifest.lkml). Read the comments in that file for more detail about what to input there.
2. Update the logic for bucketing Sessions into Channels in the derived table in the [sessions view](/projects/attribution/files/views/sessions.view.lkml).
3. Adjust the session timeout period in the derived table in the [sessions view](/projects/attribution/files/views/sessions.view.lkml), the default is 30 minutes of inactivity to create a new session.
4. Add your own custom attribution models to the [conversion_attribution](/projects/attribution/files/views/conversion_attribution.view.lkml) view, the default models include first-touch, last-touch, linear, time-decay, and 40-20-40.
5. Open the Attribution dashboard to see your data populated and adjust the queries, visuals, and filters as you see fit.
