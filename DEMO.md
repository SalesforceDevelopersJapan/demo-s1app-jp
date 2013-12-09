# Dreamforce 13 Developer Keynote - Salesforce1 App Demo #

<a name="overview" />
## Overview ##

In this demo you will work with a custom application called **Opinionator**. **Opinionator** lets you track answers to questions you ask your customers. We will use this application to demonstrate how to build a Salesforce1 app using the key capabilities of the platform.

<a name="technologies" />
### Key Technologies ###

The following technologies are highlighted in this demo:

- Force Command-line Interface (CLI)
- Report Types & Reports
- Salesforce1 Apps
- Mobile Cards
- Publisher Actions (Quick Actions)
- Compact Views

<a name="sections" />
### Sections ###

This demo is made of five sections:

- [Section 1: Create your Report Types and Reports](https://github.com/developerforce/demo-df13-devkeynote-s1app/blob/master/DEMO.md#section1)
- [Section 2: Create your Visualforce Pages and Charts using the Analytics API](https://github.com/developerforce/demo-df13-devkeynote-s1app/blob/master/DEMO.md#section2)
- [Section 3: Add a Mobile Card to your Salesforce1 Application](https://github.com/developerforce/demo-df13-devkeynote-s1app/blob/master/DEMO.md#section3)
- [Section 4: Add a Quick Action to your Salesforce1 Application](https://github.com/developerforce/demo-df13-devkeynote-s1app/blob/master/DEMO.md#section4)
- [Section 5: Create a Compact Layout for the Opinion Question](https://github.com/developerforce/demo-df13-devkeynote-s1app/blob/master/DEMO.md#section5)

It is recommended that you start with [Section 1](https://github.com/developerforce/demo-df13-devkeynote-s1app/blob/master/DEMO.md#section1) and proceed to the end.

<a name="demo" />
## Demo ##

<a name="section1" />
#### Section 1: Create your Report Types and Reports ####

In this demo we will use reports within a Salesforce1 application. To create these custom reports, we must first create a custom report type from which we will create and customize our report.

We will create a report that displays answers to our opinion questions.

##### Create the custom Report Type #####

1. Create a new Report Type. **Setup** | **Create** | **Report Types**. If prompted click **Continue**.

2. Click **New Custom Report Type**.

3. From the **Primary Object** select **Opinion Question Answers**.

4. For **Report Type Label** enter **Opinion Question Answers**. The **Report Type Name** will autocomplete.

5. For **Description** enter **Custom report type for opinion question answers**.

6. From **Store in Category** select **Other Reports**.

7. Choose **Deployed** from **Deployment Status**.

8. Click **Next**.

9. Click **Save**.

##### Create the custom Report #####

1. Click the **+** button on the menu near **Home** and **Opinions**.

2. Click **Reports**.

3. Click **New Report**.

4. Under **Other Reports** select **Opinion Question Answers** and click **Create**.

5. Change the report  from **Tabular** to **Matrix**.

6. Drag **Opinion Question: Opinion Question Name** to the area that reads **Drop a field here to create a row grouping.**

7. Drag **Answer** to the area that reads **Drop a field here to create a column grouping.**

8. Click **Save**.

9. Name the report **Answers**. The **Report Unique Name** will autocomplete.

10. Run the report.

10. Grab the **Report Id**. You can find this value in the browser URL. Copy this down to use later.

	![capturereportid](https://f.cloud.github.com/assets/746259/1708947/b2269cce-6116-11e3-92a2-5d3000de90b6.png)

We have now successfully created the Report Type and Report required for the rest of the demo.

<a name="section2" />
#### Section 2: Create your Visualforce Pages and Charts using the Analytics API ####

##### Create the Visualforce Component #####

1. Create a new **Component**. **Setup** | **Develop** | **Components**.

2. Click **New**.

3. For **Label** enter **OpinionChartPie**. The **Name** will autocomplete.

4. Add the following code into the **Visualforce Markup** tab. You can also find this code in the **src** folder in the file **OpinionChartPie.component**.

	````html
	<apex:component >
		<apex:attribute name="reportId" description="ReportId" type="String" id="reportId"/>
		<apex:attribute name="questionName" description="Question Name" type="String" id="questionName"/>
	    <apex:includeScript value="//code.jquery.com/jquery.js"/>
	    <!--
		<apex:includeScript value="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" />
	    -->
	    <apex:includeScript value="//cdnjs.cloudflare.com/ajax/libs/d3/3.3.9/d3.min.js" />
	    <apex:includeScript value="//cdnjs.cloudflare.com/ajax/libs/nvd3/1.1.13-beta/nv.d3.min.js"/>
	    
	    <apex:stylesheet value="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <apex:stylesheet value="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css"/>
	    <apex:includeScript value="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"/>

	    <script>
	     var myChart;
	     var chart;
	     var that = {}
	 $(document).ready(function(){
		
	    $.ajax('/services/data/v29.0/analytics/reports/{!reportId}',
	        {
	            type: "POST",
	            data:{
				    "reportMetadata": {
		        	    "reportFilters": [
	    	        	{
	        	        	"value": "{!questionName}",
		            	    "operator": "equal",
	    	            	"column": "072E0000002ec1f"
	        	    	}]
	                }
	            },
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader('Authorization', 'Bearer {!$Api.Session_ID}');
	            },
	            success: function(response) {
	                /* Format the data */
	                that.simpleData = []
	                $.each(response.groupingsDown.groupings, function(di, de) {
	                    $.each(response.groupingsAcross.groupings, function(ai, ae) {
	                        that.simpleData.push({"key": ae.label, "y": response.factMap[de.key+"!"+ae.key].aggregates[0].value});
	                    });
	                });

	                /* Chart */
	                 mychart = nv.addGraph(function() {
	                     var windowBox = getWindowBox();
	                    var width = windowBox.width,
	                	    height = windowBox.height;
	                
	                    chart = nv.models.pieChart()
	                        .x(function(d) { return d.key })
	                        .y(function(d) { return d.y })
	                        .color(d3.scale.category10().range())
	                        .width(width)
	                        .height(height);
	               
	                    d3.select("#chart1")
	                        .datum(that.simpleData)
	                        .transition()
	                        .duration(1200)
	                        .attr('width', width)
	                        .attr('height', height)
							.attr("viewBox", "0, 0, " + width + ", " + height)
							.attr("preserveAspectRatio", "xMinYMin")
	                        .call(chart);
	                
	                    chart.dispatch.on('stateChange', function(e) { nv.log('New State:', JSON.stringify(e)); });
	                    nv.utils.windowResize(chart.update);
	                    return chart;
	                });
	            }
	        }
	    );
	});

		function getWindowBox(){
	        var w = window,
	        d = document,
	        e = d.documentElement,
	        g = d.getElementById('chart'),
	        x = w.innerWidth || e.clientWidth || g.clientWidth,
	        y = w.innerHeight|| e.clientHeight|| g.clientHeight;
	        x = w.innerWidth || e.clientWidth || g.clientWidth;
	        y = w.innerHeight|| e.clientHeight|| g.clientHeight;
	        return { width:x, height:y };
	    }
		function updateWindow() {
	        var box = getWindowBox();
	        $("#chart1").attr("width", box.width).attr("height", box.height);
	    }
	    window.onresize = updateWindow;
	    
	        
	</script>
	<div class="row">
	    <svg id="chart1"></svg>
	</div>
	</apex:component>
	````

5. Click **Save**.

##### Create the Visualforce Page #####

1. Create a new **Visualforce page**. **Setup** | **Develop** | **Pages**.

2. Click **New**.

3. For **Label** enter **OpinionChartPie**. The **Name** will autocomplete.

4. Check the box next to **Available for Salesforce mobile apps**.

5. Add the following code into the **Visualforce Markup** tab. You can also find this code in the **src* folder in the file **OpinionChartPie.page**.

	**Note**: replace **YOURREPORTID** with the Report Id you captured in the last section.

	````html
	<apex:page cache="false"
	    standardController="Opinion_Question__c"
	    standardStylesheets="false"
	    showHeader="false"
	    sidebar="false">
	        
	  <meta name="viewport" content="width=device-width"/>
	  <c:OpinionChartPie questionName="{!Opinion_Question__c.Name}" reportId="YOURREPORTID">
	  </c:OpinionChartPie>

	</apex:page>
	`````

6. Click **Save**.

7. Click **Preview** to confirm your report runs correctly. You should see a chart similar to the following:

	![Opinion Pie Chart Preview](https://f.cloud.github.com/assets/746259/1708981/655d14bc-6117-11e3-8f7b-c0915ac8362a.png)

You have successfully created a Visualforce Component and Page.

<a name="section3" />
#### Section 3: Add a Mobile Card to your Salesforce1 Application ####

Let's update the Opinion Question page layout to include a mobile card.

1. Select the **Opinion Question** page layout. **Setup** | **Create** | **Objects**.

2. Select **Opinion Question** from the list.

3. Under the **Page Layouts** section click **Edit** next to the **Opinion Question Layout**.

4. Select **Visualforce Pages** from the **Opinion Question Layout** and drag it to the **Mobile Cards (Salesforce1 only) section. 

	![Opinion Pie Chart in the Mobile Cards](https://f.cloud.github.com/assets/746259/1709006/c469da3a-6117-11e3-9191-a0f5db4c5b25.png)

5. Click **Save**.

Let's give it a try.

1. In a new tab on your browser enter the following url: [https://na11.salesforce.com/one/one.app](https://na11.salesforce.com/) to login to the Salesforce1 web client.

	**Note**: this client is designed for a mobile screen. You may want to reduce the size of your browser window to make this look more appropriate. Alternatively, you can use a mobile simulator/emulator to login or download the application from the Apple Store or Google Play.

2. Expand the menu in the upper-left, expand **Show More** and select the **Opinions** app.

3. Choose the **OP-0000** opinion.

4. Swipe to the right (or click the right dot) and click on **Opinion Questions**.

5. Choose the **OQ-0000** question.

6. Swipe to the right (or click the right dot). You will see the graph on the page.

	![Chart in Mobile Client](https://f.cloud.github.com/assets/746259/1709024/1df57d66-6118-11e3-8d41-cc042a8b7d48.png)

Let's make an additional update to display the question on the page.

1. On the **Opinion Question Layout** select **Expanded Lookups**.

2. Drag **Opinion** under the **OpinionChartPie** you recently added. Click **Save**.

	![Adding the Opinion under the Opinion Chart Page](https://f.cloud.github.com/assets/746259/1709061/7aa6f2ba-6118-11e3-85ba-4643af06af9c.png)


3. Go back to your mobile Salesforce1 app. Refresh the page and return to the chart. You now see the **Opinion Question** information below the chart.

	![Opinion Chart with Opinion Question](https://f.cloud.github.com/assets/746259/1709078/bd5ce272-6118-11e3-8473-9c88f9d0281f.png)

Congratulations. You have added a mobile card to your Salesforce1 application.

<a name="section4" />
#### Section 4: Add a Quick Action to your Salesforce1 Application ####

1. Click **Setup** | **Create** | **Objects**.

2. Select **Opinion Question** from the list.

3. Under the **Buttons, Links, and Actions** section click **New Action**.

4. Select **Update a Record** from the **Action Type**.

5. For **Label** enter **Deactivate Question**. The **Name** will autocomplete.

6. Click **Save**.

7. From the **Opinion Question Fields** drag **Deactivation Reason** to the page.

	![Deactivation Reason](https://f.cloud.github.com/assets/746259/1709108/1faddd3c-6119-11e3-8b60-c84cbd7821fc.png)

8. Click **Save**.

9. Click **New** under **Predefined Field Values**.

10. Select **Is Active** from the **Field Name**.

11. In the formula editor enter "False" under the **Specify New Field Value**.

12. Click **Save**.

13. Under the **Page Layouts** section click **Edit** next to the **Opinion Question Layout**.

14. Click the link **override the global publisher layout** under **Publisher Actions**.

15. Select **Actions** under the **Opinion Question Layout**.

16. Drag the **Deactivate Question** to the front of the **Publisher Actions** list.

	![Deactivation Reason in Pulisher Actions list](https://f.cloud.github.com/assets/746259/1709130/6b5eb4ae-6119-11e3-92ec-b71f250bb264.png)

17. Click **Save**.

Let's try it out and see it in action!

1. Return to the mobile application. Make sure you've refreshed the application.

2. Expand the menu in the upper-left, expand **Show More** and select the **Opinions** app.

3. Choose the **OP-0000** opinion.

4. Swipe to the right (or click the right dot) and click on **Opinion Questions**.

5. Choose the **OQ-0001** question.

6. Click the **Quick Actions** button in the lower right-hand corner of the screen. It is a blue box with a + in the middle.

	![deactivatequestionactionlist](https://f.cloud.github.com/assets/746259/1709135/9ad5657a-6119-11e3-8631-a7ccd4958d9f.png)

7. Click **Deactivate Question**.

8. Select **Boss Told Me To** from the **Deactivation Reason** list.

	![Select Deactivation Reason](https://f.cloud.github.com/assets/746259/1709147/c070bdd4-6119-11e3-8917-9f08b9003f41.png)

9. Click **Submit**.

<a name="section5" />
#### Section 5: Create a Compact Layout for the Opinion Question ####

1. Click **Setup** | **Create** | **Objects**.

2. Select **Opinion Question** from the list.

3. Under **Compact Layouts** click **New**.

4. For **Label** enter **Custom Compact Layout**. The **Name** will autocomplete.

5. Choose the following fields to add in this order: **Opinion Question Name**, **Question**, **Is Active**, and **Deactivation Reason**.

6. Click **Save**.

7. Click **Compact Layout Assignment** and **Edit Assignment**. Select **Custom Compact Layout** from the list and click **Save**.

8. Return to the mobile application. Make sure you've refreshed the application.

	**Note**: Salesforce aggressively caches pages. You may have to clear your browser history or close the browser/emulator to see the updated view.

9. You will now see an updated mobile view based on the compact view you just created.

Congratulations! You have successfully completed this demo application.




