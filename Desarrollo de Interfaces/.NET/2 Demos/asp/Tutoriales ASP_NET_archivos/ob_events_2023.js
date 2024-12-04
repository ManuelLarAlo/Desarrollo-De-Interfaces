function ob_OnNodeDrop(src, dst)
{    
    // add client side code here
	//alert("OnNodeDrop from " + src + " to " + dst);
	if(ob_ev("OnNodeDrop"))
	{
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("src", src);
	        ob_post.AddParam("dst", dst);
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnNodeDrop");
	    }
	    else
	    {
	        alert("Please add obout_Postback control to your page to use the server-side events");
	    }
	}
}

function ob_OnNodeDropOutside(dst)
{    
    // add client side code here
    //alert("ob_OnNodeDropOutside");
    
    ob_t2_CopyToControl(dst); // comment this line if you don't want to drop nodes into textboxes
    
    if(ob_ev("OnNodeDropOutside"))
	{
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("dst", dst);	        
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnNodeDropOutside");
	    }
	    else
	    {
	        alert("Please add obout_Postback control to your page to use the server-side events");
	    }
	}
}  


function ob_OnNodeSelect(id)
{       
     // add client side code here
	 //alert("OnNodeSelect on " + id);
	 if(ob_ev("OnNodeSelect"))
	 {	    
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("id", id);
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnNodeSelect");
	    }
	    else
	    {
	        alert("Please add obout_Postback control to your page to use the server-side events");
	    } 
	 }
}

function ob_OnNodeEdit(id, text, prevText)
{    
    // add client side code here
	//alert("OnNodeEdit on " + id + "\n  text: " + text + "\n prevText: " + prevText);	
	if(ob_ev("OnNodeEdit"))
	{
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("id", id);
	        ob_post.AddParam("text", text);
	        ob_post.AddParam("prevText", prevText);
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnNodeEdit");
	    }
	    else
	    {
	        alert("Please add obout_Postback control to your page to use the server-side events");
	    } 
	} 
}

function ob_OnAddNode(parentId, childId, textOrHTML, expanded, image, subTreeURL)
{    
	// add client side code here
	/*alert("OnAddNode:\n  parentId: " + (parentId || "none")
			+ "\n  childId: " + (childId || "none")
			+ "\n  textOrHTML: " + (textOrHTML || "none")
			+ "\n  expanded: " + (expanded || "false")
			+ "\n  image: " + (image || "none")
			+ "\n  subTreeURL: " + (subTreeURL || "none"));*/
   
	if(ob_ev("OnAddNode"))
	{
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("parentId", parentId);
	        ob_post.AddParam("childId", childId);
	        ob_post.AddParam("textOrHTML", textOrHTML);
	        ob_post.AddParam("expanded", expanded ? expanded : 0);
	        ob_post.AddParam("image", image ? image : "");
	        ob_post.AddParam("subTreeURL", subTreeURL ? subTreeURL : "");
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnAddNode");
	    } 		
	    else
	    {
	        alert("Please add obout_Postback control to your page to use the server-side events");
	    } 
	}
}

function ob_OnRemoveNode(id)
{    
     // add client side code here
	 //alert("OnRemoveNode on " + id);
	 if(ob_ev("OnRemoveNode"))
	 {
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("id", id);
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnRemoveNode");
	    }
	    else
	    {
	        alert("Please add obout_Postback control to your page to use the server-side events");
	    } 
	 }
}

/*
	Pre-events.
	Use them to implement your own validation for such operations as add, remove, edit
*/

function ob_OnBeforeAddNode(parentId, childId, textOrHTML, expanded, image, subTreeURL)
{        
	// add your own validation code
	// e.g. it may use synchronized obout postback to query
	// server side application whether such operation is valid
	//alert("ob_OnBeforeAddNode");	
	if(ob_ev("OnBeforeAddNode"))
	{
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("parentId", parentId);
	        ob_post.AddParam("childId", childId);
	        ob_post.AddParam("textOrHTML", textOrHTML);
	        ob_post.AddParam("expanded", expanded ? expanded : 0);
	        ob_post.AddParam("image", image ? image : "");
	        ob_post.AddParam("subTreeURL", subTreeURL ? subTreeURL : "");
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnBeforeAddNode");
	    }
	    else
	    {
	        alert("Please add obout_Postback control to your page to use the server-side events");
	    } 
	} 	
	return true;
}

function ob_OnBeforeRemoveNode(id)
{    
	// add your own validation code
	// e.g. it may use synchronized obout postback to query
	// server side application whether such operation is valid
	//alert("ob_OnBeforeRemoveNode");
	if(ob_ev("OnBeforeRemoveNode"))
	{
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("id", id);
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnBeforeRemoveNode");
	    }
	    else
	    {
	        alert("Please add obout_Postback control to your page to use the server-side events");
	    } 
	}
	return true;
}

function ob_OnBeforeNodeEdit(id)
{    
	// add your own validation code
	// e.g. it may use synchronized obout postback to query
	// server side application whether such operation is valid
	//alert("ob_OnBeforeNodeEdit");
	if(ob_ev("OnBeforeNodeEdit"))
	{
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("id", id);
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnBeforeNodeEdit");
	    }
	    else
	    {
	        alert("Please add obout_Postback control to your page to use the server-side events");
	    } 
	}
	return true;
}

function ob_OnBeforeNodeDrop(src, dst)
{    
	// add your own validation code
	// e.g. it may use synchronized obout postback to query
	// server side application whether such operation is valid
	//alert("ob_OnBeforeNodeDrop");
	if(ob_ev("OnBeforeNodeDrop"))
	{
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("src", src);
	        ob_post.AddParam("dst", dst);
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnBeforeNodeDrop");
	    }
	    else
	    {
	        alert("Please add obout_Postback control to your page to use the server-side events");
	    }
	}	
	return true;
}

function ob_OnNodeExpand(id)
{
    // add client side code here
	//alert("OnNodeExpand on " + id);				        
        
    if(ob_ev("OnNodeExpand"))
	{
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("id", id);	        
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnNodeExpand");
	    }
	    else
	    {
	        alert("Please add obout_Postback control to your page to use the server-side events");
	    }
	}		
}



function ob_OnNodeCollapse(id)
{
    // add client side code here
	//alert("OnNodeCollapse on " + id);			
	
    if(ob_ev("OnNodeCollapse"))
	{
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("id", id);	        
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnNodeCollapse");
	    }
	    else
	    {
	        alert("Please add obout_Postback control to your page to use the server-side events");
	    }
	}		
}
