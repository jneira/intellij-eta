package com.typelead.intellij.plugin.eta.jps.model;

import com.intellij.util.xmlb.annotations.Tag;

/** Build options for Eta projects. */
public class EtaBuildOptions {

  @Tag("etaPath")    public String etaPath = "";
  @Tag("etlasPath")  public String etlasPath = "";

  public EtaBuildOptions() {
  }

  public EtaBuildOptions(EtaBuildOptions options) {
    etaPath = options.etaPath;
    etlasPath = options.etlasPath;
  }

  public EtaBuildOptions copy() {
    return new EtaBuildOptions(this);
  }

  @Override
  public String toString() {
    return "EtaBuildOptions{" +
      "etaPath=" + etaPath +
      ", etlasPath=" + etlasPath +
      "}";
  }
}
