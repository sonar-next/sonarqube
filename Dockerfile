FROM sonarqube:8.9-community

ENV SONARQUBE_HOME=/opt/sonarqube
ENV SONARQUBE_PLUGINS=$SONARQUBE_HOME/extensions/plugins/

RUN rm -f $SONARQUBE_PLUGINS/sonar-html-plugin-*.jar \
&& rm -f $SONARQUBE_PLUGINS/sonar-xml-plugin-*.jar \
&& rm -f $SONARQUBE_PLUGINS/sonar-vbnet-plugin-*.jar \
&& rm -f $SONARQUBE_PLUGINS/sonar-flex-plugin-*.jar

RUN curl -L -o $SONARQUBE_PLUGINS/sonar-cxx-plugin.jar https://github.com/SonarOpenCommunity/sonar-cxx/releases/download/cxx-2.0.6/sonar-cxx-plugin-2.0.6.2925.jar \
&& curl -L -o $SONARQUBE_PLUGINS/sonar-findbugs-plugin.jar https://github.com/spotbugs/sonar-findbugs/releases/download/4.0.5/sonar-findbugs-plugin-4.0.5.jar \
&& curl -L -o $SONARQUBE_PLUGINS/checkstyle-sonar-plugin.jar https://github.com/checkstyle/sonar-checkstyle/releases/download/9.2/checkstyle-sonar-plugin-9.2.jar
# pmd p3c and flutter
RUN curl -L -o $SONARQUBE_PLUGINS/sonar-pmd-plugin.jar https://github.com/magaofei/sonar-pmd-p3c/releases/download/3.2.2/sonar-pmd-plugin-3.2.2.jar \
&& curl -L -o $SONARQUBE_PLUGINS/sonar-flutter-plugin.jar https://github.com/insideapp-oss/sonar-flutter/releases/download/0.4.0/sonar-flutter-plugin-0.4.0.jar

# sql 如果启用该插件，且仓库中包含 .sql 文件，将会极大的影响扫描速度
# RUN curl -L -o $SONARQUBE_PLUGINS/sonar-sql-plugin-1.1.0.jar https://github.com/gretard/sonar-sql-plugin/releases/download/1.1.0/sonar-sql-plugin-1.1.0.jar

# swift and objective-c
RUN curl -L -o $SONARQUBE_PLUGINS/sonar-swift-plugin.jar https://github.com/sonar-next/sonar-swift/releases/download/v1.6.0/sonar-swift-plugin-1.6.0.jar
RUN curl -L -o $SONARQUBE_PLUGINS/branch-plugin.jar https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/1.8.1/sonarqube-community-branch-plugin-1.8.1.jar \
    && cp $SONARQUBE_PLUGINS/branch-plugin.jar $SONARQUBE_HOME/lib/common
   
# COPY sonar.properties $SONARQUBE_HOME/conf/sonar.properties
