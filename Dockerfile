FROM sonarqube:7.9-community

ENV SONARQUBE_HOME=/opt/sonarqube
ENV SONARQUBE_PLUGINS=$SONARQUBE_HOME/extensions/plugins/

RUN rm -f $SONARQUBE_PLUGINS/sonar-html-plugin-*.jar \
&& rm -f $SONARQUBE_PLUGINS/sonar-xml-plugin-*.jar \
&& rm -f $SONARQUBE_PLUGINS/sonar-vbnet-plugin-*.jar \
&& rm -f $SONARQUBE_PLUGINS/sonar-flex-plugin-*.jar \
&& rm -f $SONARQUBE_PLUGINS/sonar-php-plugin-*.jar \
&& rm -f $SONARQUBE_PLUGINS/sonar-javascript-plugin-*.jar \
&& rm -f $SONARQUBE_PLUGINS/sonar-typescript-plugin-*.jar \
&& rm -f $SONARQUBE_PLUGINS/sonar-python-plugin-*.jar \
&& rm -f $SONARQUBE_PLUGINS/sonar-css-plugin-*.jar \
&& rm -f $SONARQUBE_PLUGINS/sonar-go-plugin-*.jar

RUN curl -L -o $SONARQUBE_PLUGINS/sonar-cxx-plugin-1.3.2.1853.jar https://github.com/SonarOpenCommunity/sonar-cxx/releases/download/cxx-1.3.2/sonar-cxx-plugin-1.3.2.1853.jar \
&& curl -L -o $SONARQUBE_PLUGINS/sonar-c-plugin-1.3.2.1853.jar https://github.com/SonarOpenCommunity/sonar-cxx/releases/download/cxx-1.3.2/sonar-c-plugin-1.3.2.1853.jar \
&& curl -L -o $SONARQUBE_PLUGINS/sonar-php-plugin-3.8.1.6222.jar https://github.com/SonarSource/sonar-php/releases/download/3.8.1.6222/sonar-php-plugin-3.8.1.6222.jar \
&& curl -L -o $SONARQUBE_PLUGINS/sonar-javascript-plugin-6.4.1-SNAPSHOT.jar https://github.com/magaofei/SonarJS/releases/download/6.4.1.12828/sonar-javascript-plugin-6.4.1-SNAPSHOT.jar \
&& curl -L -o $SONARQUBE_PLUGINS/sonar-python-plugin-2.12.0.7065.jar https://github.com/SonarSource/sonar-python/releases/download/2.12.0.7065/sonar-python-plugin-2.12.0.7065.jar \
&& curl -L -o $SONARQUBE_PLUGINS/sonar-css-plugin-1.2.0.1325.jar https://github.com/SonarSource/sonar-css/releases/download/1.2.0.1325/sonar-css-plugin-1.2.0.1325.jar \
&& curl -L -o $SONARQUBE_PLUGINS/sonar-findbugs-plugin-4.0.0.jar https://github.com/spotbugs/sonar-findbugs/releases/download/4.0.0/sonar-findbugs-plugin-4.0.0.jar \
&& curl -L -o $SONARQUBE_PLUGINS/checkstyle-sonar-plugin-8.37.jar https://github.com/checkstyle/sonar-checkstyle/releases/download/8.37/checkstyle-sonar-plugin-8.37.jar \
&& curl -L -o $SONARQUBE_PLUGINS/sonar-go-plugin-1.6.0.719.jar https://binaries.sonarsource.com/Distribution/sonar-go-plugin/sonar-go-plugin-1.6.0.719.jar

# pmd p3c and flutter
RUN curl -L -o $SONARQUBE_PLUGINS/sonar-pmd-plugin-3.2.2.jar https://github.com/magaofei/sonar-pmd-p3c/releases/download/3.2.2/sonar-pmd-plugin-3.2.2.jar \
&& curl -L -o $SONARQUBE_PLUGINS/sonar-flutter-plugin-0.3.1.jar https://github.com/magaofei/sonar-flutter/releases/download/0.3.1-0/sonar-flutter-plugin-0.3.1.jar

# sql 如果启用该插件，且仓库中包含 .sql 文件，将会极大的影响扫描速度
# RUN curl -L -o $SONARQUBE_PLUGINS/sonar-sql-plugin-1.1.0.jar https://github.com/gretard/sonar-sql-plugin/releases/download/1.1.0/sonar-sql-plugin-1.1.0.jar

# swift and objective-c
RUN curl -L -o $SONARQUBE_PLUGINS/tal-sonar-swift-plugin-1.0.3.jar https://github.com/tal-tech/sonar-swift/releases/download/1.0.3/tal-sonar-swift-plugin-1.0.3.jar
RUN curl -L -o $SONARQUBE_PLUGINS/branch-plugin.jar https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/1.3.2/sonarqube-community-branch-plugin-1.3.2.jar \
    && cp $SONARQUBE_PLUGINS/branch-plugin.jar $SONARQUBE_HOME/lib/common
   
# COPY sonar.properties $SONARQUBE_HOME/conf/sonar.properties
