package com.typelead.intellij.plugin.eta.project.template.gradle;

import com.intellij.framework.FrameworkTypeEx;
import com.intellij.openapi.externalSystem.model.project.ProjectId;
import com.intellij.openapi.module.Module;
import com.intellij.openapi.roots.ContentEntry;
import com.intellij.openapi.roots.ModifiableModelsProvider;
import com.intellij.openapi.roots.ModifiableRootModel;
import com.intellij.openapi.util.io.FileUtilRt;
import com.intellij.openapi.vfs.VirtualFile;
import com.typelead.intellij.plugin.eta.lang.EtaFacetType;
import com.typelead.intellij.plugin.eta.project.template.EtaFrameworkType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.plugins.gradle.frameworkSupport.BuildScriptDataBuilder;
import org.jetbrains.plugins.gradle.frameworkSupport.GradleFrameworkSupportProvider;

import java.io.File;
import java.util.Arrays;

public class GradleEtaFrameworkSupportProvider extends GradleFrameworkSupportProvider {

  @NotNull
  @Override
  public FrameworkTypeEx getFrameworkType() {
    return EtaFrameworkType.getInstance();
  }

  @Override
  public void addSupport(@NotNull ProjectId projectId, @NotNull Module module, @NotNull ModifiableRootModel rootModel, @NotNull ModifiableModelsProvider modifiableModelsProvider, @NotNull BuildScriptDataBuilder buildScriptData) {
    EtaFacetType.addToModule(module);
    tryCreateEtaSrcDir(rootModel);
    buildScriptData
      .addPluginDefinitionInPluginsGroup("id 'com.typelead.eta' version '0.7.3'")
      .addPropertyDefinition(
        unlines(
          "eta {",
          "  version = '0.8.0b2'",
          "  etlasVersion = '1.4.0.0'",
          "}"
        )
      )
      .addDependencyNotation("compile eta('base:4.8.2.0')");
  }

  private String unlines(String... lines) {
    return String.join("\n", Arrays.asList(lines));
  }

  private void tryCreateEtaSrcDir(ModifiableRootModel rootModel) {
    ContentEntry[] contentEntries = rootModel.getContentEntries();
    if (contentEntries.length == 0) return;
    VirtualFile rootFile = contentEntries[0].getFile();
    if (rootFile == null) return;
    String rootPath = rootFile.getCanonicalPath();
    if (rootPath == null) return;
    FileUtilRt.createDirectory(new File(rootPath, "src/main/eta"));
  }
}
