# Stop the Local Honeycomb by removing the entire Stack.
# Note : Any API added to the honeycomb, will also be removed.
docker stack rm fcr-domain

# Wait for all networks and containers to be removed before ending the script.
echo "Cleaning up Services and Networks..."
sleep 10