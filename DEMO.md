# DF13 Dev Keynote Salesforce1 App #

---
<a name="overview" />
## Overview ##


<a name="technologies" />
### Key Technologies ###

Publisher Actions



<a name="demo" />
## Demo ##

#### Step 1: Create your Report Types and Reports ####

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

![Report Id]() 

We have now successfully created the Report Type and Report required for the rest of the demo.

#### Step 2: Create your Visualforce Pages and Charts using the Analytics API ####
https://na11.salesforce.com/reportbuilder/reportType.apexp#


#### Step 3: Add a Mobile Card to your Salesforce1 Application ####

1. Create a new **Component**. **Setup** | **Develop** | **Components**.

2. Click **New**.

3. For **Label** enter **OpinionChartPie**. The **Name** will autocomplete.

4. Add the following code into the **Visualforce Markup** tab.

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



#### Step 4: Add a Quick Action to your Salesforce1 Application ####



#### Step 5: Compact Layout?









3. Select the **Opinionator** application from the upper-right dropdown menu and then choose the **Opinions** tab.

	![Opinionator App]()

	![Opinions Tab]()

3. Click **Go!** next to **View** | **All**. Select the option **OP-0000**.




