
# Splunk Commands Reference

## Splunk CLI Commands

### General Commands
- **`splunk start`**: Starts the Splunk service.
- **`splunk stop`**: Stops the Splunk service.
- **`splunk restart`**: Restarts the Splunk service.
- **`splunk status`**: Displays the status of the Splunk service.

### User Management
- **`splunk add user <username>`**: Adds a new user.
- **`splunk edit user <username>`**: Edits an existing user.
- **`splunk list user`**: Lists all users.

### Data Inputs
- **`splunk add monitor <path>`**: Adds a file or directory to be monitored.
- **`splunk remove monitor <path>`**: Removes a file or directory from being monitored.
- **`splunk list monitor`**: Lists all monitored files and directories.

### Forwarder Management
- **`splunk add forward-server <host>:<port>`**: Adds a forward server.
- **`splunk remove forward-server <host>:<port>`**: Removes a forward server.
- **`splunk list forward-server`**: Lists all forward servers.

### Index Management
- **`splunk add index <indexname>`**: Adds a new index.
- **`splunk remove index <indexname>`**: Removes an index.
- **`splunk list index`**: Lists all indexes.

### Configuration
- **`splunk show config <file>`**: Shows the configuration file.
- **`splunk btool <file> list`**: Lists the settings in a configuration file.
- **`splunk set default-index <index>`**: Sets the default index for searches.

## Splunk Search Processing Language (SPL) Commands

### Basic Search Commands
- **`search`**: Retrieves events from indexes.
- **`index`**: Specifies the index to search.
- **`sourcetype`**: Specifies the source type of the events.

### Filtering Commands
- **`where`**: Filters results based on a condition.
- **`dedup`**: Removes duplicate events.
- **`sort`**: Sorts results based on specified fields.

### Reporting and Aggregation
- **`stats`**: Calculates aggregate statistics.
- **`timechart`**: Creates a time-based chart.
- **`chart`**: Creates a chart based on specified fields.
- **`top`**: Lists the most common values of a field.
- **`rare`**: Lists the least common values of a field.

### Transforming Commands
- **`eval`**: Evaluates an expression.
- **`rename`**: Renames fields in the search results.
- **`table`**: Displays fields in a tabular format.
- **`fields`**: Includes or excludes specified fields from the results.

### Data Enrichment
- **`lookup`**: Looks up additional fields from an external source.
- **`geostats`**: Calculates geographic statistics.
- **`transaction`**: Groups events into transactions.

### Event Manipulation
- **`rex`**: Extracts fields using regular expressions.
- **`spath`**: Extracts fields from structured data formats like JSON or XML.
- **`replace`**: Replaces values of specified fields.

### Miscellaneous Commands
- **`inputcsv`**: Reads data from a CSV file.
- **`outputcsv`**: Writes search results to a CSV file.
- **`sendemail`**: Sends an email with search results.
- **`makemv`**: Creates multi-value fields from single-value fields.
- **`mvexpand`**: Expands multi-value fields into separate events.

## Usage Examples

### Starting Splunk
\`\`\`sh
splunk start
\`\`\`

### Adding a New User
\`\`\`sh
splunk add user john -role user -password password123
\`\`\`

### Adding a Forward Server
\`\`\`sh
splunk add forward-server splunkserver.example.com:9997 -auth admin:yourpassword
\`\`\`

### Basic Search
\`\`\`sh
search index=main sourcetype=access_combined | stats count by status
\`\`\`

## Reference Documentation

For a comprehensive list of commands and detailed documentation, you can refer to the [Splunk Documentation](https://docs.splunk.com/Documentation/Splunk/latest).
