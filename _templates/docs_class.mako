<%inherit file="base.mako" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    ${self.head()}
  </head>
  <body>
    <div id="content">
      ${self.header()}
      <div id="body-wrap">
        <div class="page-left-wide">
          <div id="main_block">
            <div id="prose_block">
              <h2>${clazz.name}</h2>
              <p>
              <%self:filter chain="syntax_highlight,markdown_template">
                  ${clazz.reference}
              </%self:filter>
              </p>
              <br/><br/>
              <h3>${clazz.name} methods list</h3>
              <ul class="functionslist">
              <% prevmethod = "" %>
              % for method in clazz.function_list:
                  % if prevmethod != method.name and method.visible and not method.advanced and method.access=='public':
                      <li> <a href="#${method.name}">${method.name}</a> </li>
                  % endif
                  <% prevmethod = method.name %>
              % endfor
              </ul>
              
              <br/><br/>
              
              <h3>${clazz.name} variables list</h3>
              <ul class="varslist">
              % for var in clazz.var_list:
                  % if var.visible and not var.advanced and var.access=='public':
                      <li> <a href="#${var.name}">${var.type} ${var.name}</a> </li>
                  % endif
              % endfor
              </ul>
              
              <br/><br/>
              
              <h3>${clazz.name} methods</h3>
              % for method in clazz.function_list:
                    % if method.visible and not method.advanced and method.access=='public':
                        <%include file="docs_method.mako" args="method=method" />    
                    % endif
              % endfor
              
              <h3>${clazz.name} variables</h3>
              % for var in clazz.var_list:
                    % if var.visible and not var.advanced and var.access=='public':
                        <%include file="docs_var.mako" args="var=var" />    
                    % endif
              % endfor
            </div><!-- End Prose Block -->
          </div><!-- End Main Block -->
        </div>
      </div>
      
      <div id="footer">
        ${self.footer()}
      </div> <!-- End Footer -->
    </div> <!-- End Content -->
  </body>
</html>
<%def name="header()">
  <%include file="header.mako"  args="active='docs'"/>
</%def>

