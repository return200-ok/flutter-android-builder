FROM ghcr.io/cirruslabs/flutter:3.19.6
WORKDIR /
RUN mkdir /opt/gradle \
    && curl -L https://services.gradle.org/distributions/gradle-7.5-all.zip -o /tmp/gradle.zip \
    && unzip -q /tmp/gradle.zip -d /opt/gradle \
    && rm /tmp/gradle.zip
RUN sdkmanager "build-tools;34.0.0" "platforms;android-34" "platforms;android-33" "platforms;android-32" "platforms;android-31" "platforms;android-30" "platforms;android-28" \
    && sdkmanager "build-tools;30.0.3" "build-tools;33.0.2" \
    && sdkmanager "emulator"
ENV PATH "$PATH:/opt/android-sdk-linux/build-tools/34.0.0"
RUN gem install fastlane
