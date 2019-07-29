#Base Image
FROM wso2/micro-integrator:latest
#Comment in axis2.xml for local transport
RUN sed -i 's+<transportReceiver name="local" class="org.wso2.carbon.core.transports.local.CarbonLocalTransportReceiver"/>+<!--transportReceiver name="local" class="org.wso2.carbon.core.transports.local.CarbonLocalTransportReceiver"/-->+g' /home/wso2carbon/wso2mi/conf/axis2/axis2.xml
RUN sed -i 's+<transportSender name="local" class="org.wso2.carbon.core.transports.local.CarbonLocalTransportSender"/>+<!--transportSender name="local" class="org.wso2.carbon.core.transports.local.CarbonLocalTransportSender"/-->+g' /home/wso2carbon/wso2mi/conf/axis2/axis2.xml
#UnComment in axis2.xml for local transport
RUN sed -i 's+<!--<transportSender name="local" class="org.apache.axis2.transport.local.NonBlockingLocalTransportSender"/>-->+<transportSender name="local" class="org.apache.axis2.transport.local.NonBlockingLocalTransportSender"/>+g' /home/wso2carbon/wso2mi/conf/axis2/axis2.xml
#Copy the car file in Carbonapps
COPY ShoppingBagCompositeApplication_1.0.0.car /home/wso2carbon/wso2mi/repository/deployment/server/carbonapps
