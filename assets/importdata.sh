echo "Starting the demo data import process. This should only take a few minutes to complete."
echo ""
echo "Step 1: Log in to your Salesforce organization. Close the browser window when complete."

force login

echo "Step 2: Starting the data import process using the Force CLI tool."
echo ""

force apex < data_opinion

echo ""
echo "The import process has completed."