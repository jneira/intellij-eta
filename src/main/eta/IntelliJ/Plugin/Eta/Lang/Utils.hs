module IntelliJ.Plugin.Eta.Lang.Utils where

import P
import Language.Eta.Main.DynFlags

-- | Default flags which can be used to initialize the Eta Lexer.
-- Adapted from Language.Eta.Parser.Lexer.lexTokenStream
defaultFlags :: DynFlags
defaultFlags =
    flip gopt_set Opt_KeepRawTokenStream
  . flip gopt_unset Opt_Haddock
  $ flags
  where
  flags = partialFlags
    { generalFlags = mempty
    , safeHaskell = Sf_None
    , extensions = mempty
    , extensionFlags = mempty
    , language = Nothing
    }

-- | Hack to not have to construct all DynFlags
-- This is copy-pasta from eta-parser's test suite
-- At some point we should try to reduce DynFlags to only what's needed in eta-parser.
-- Thanks to lazy evaluation, exceptions will only be thrown WHEN an undefined field is accessed.
partialFlags :: DynFlags
partialFlags = DynFlags
  { ghcMode = error "DynFlag ghcMode not defined"
  , ghcLink = error "DynFlag ghcLink not defined"
  , hscTarget = error "DynFlag hscTarget not defined"
  , settings = error "DynFlag settings not defined"
  , sigOf = error "DynFlag sigOf not defined"
  , verbosity = error "DynFlag verbosity not defined"
  , optLevel = error "DynFlag optLevel not defined"
  , debugLevel = error "DynFlag debugLevel not defined"
  , simplPhases = error "DynFlag simplPhases not defined"
  , maxSimplIterations = error "DynFlag maxSimplIterations not defined"
  , ruleCheck = error "DynFlag ruleCheck not defined"
  , strictnessBefore = error "DynFlag strictnessBefore not defined"
  , parMakeCount = error "DynFlag parMakeCount not defined"
  , enableTimeStats = error "DynFlag enableTimeStats not defined"
  , ghcHeapSize = error "DynFlag ghcHeapSize not defined"
  , maxRelevantBinds = error "DynFlag maxRelevantBinds not defined"
  , simplTickFactor = error "DynFlag simplTickFactor not defined"
  , specConstrThreshold = error "DynFlag specConstrThreshold not defined"
  , specConstrCount = error "DynFlag specConstrCount not defined"
  , specConstrRecursive = error "DynFlag specConstrRecursive not defined"
  , liberateCaseThreshold = error "DynFlag liberateCaseThreshold not defined"
  , floatLamArgs = error "DynFlag floatLamArgs not defined"
  , historySize = error "DynFlag historySize not defined"
  , cmdlineHcIncludes = error "DynFlag cmdlineHcIncludes not defined"
  , importPaths = error "DynFlag importPaths not defined"
  , mainModIs = error "DynFlag mainModIs not defined"
  , mainFunIs = error "DynFlag mainFunIs not defined"
  , ctxtStkDepth = error "DynFlag ctxtStkDepth not defined"
  , tyFunStkDepth = error "DynFlag tyFunStkDepth not defined"
  , thisInstalledUnitId = error "DynFlag thisInstalledUnitId not defined"
  , thisComponentId_ = error "DynFlag thisComponentId_ not defined"
  , thisUnitIdInsts_ = error "DynFlag thisUnitIdInsts_ not defined"
  , ways = error "DynFlag ways not defined"
  , buildTag = error "DynFlag buildTag not defined"
  , rtsBuildTag = error "DynFlag rtsBuildTag not defined"
  , splitInfo = error "DynFlag splitInfo not defined"
  , objectDir = error "DynFlag objectDir not defined"
  , dylibInstallName = error "DynFlag dylibInstallName not defined"
  , hiDir = error "DynFlag hiDir not defined"
  , stubDir = error "DynFlag stubDir not defined"
  , dumpDir = error "DynFlag dumpDir not defined"
  , objectSuf = error "DynFlag objectSuf not defined"
  , hcSuf = error "DynFlag hcSuf not defined"
  , hiSuf = error "DynFlag hiSuf not defined"
  , canGenerateDynamicToo = error "DynFlag canGenerateDynamicToo not defined"
  , dynObjectSuf = error "DynFlag dynObjectSuf not defined"
  , dynHiSuf = error "DynFlag dynHiSuf not defined"
  , dllSplitFile = error "DynFlag dllSplitFile not defined"
  , dllSplit = error "DynFlag dllSplit not defined"
  , outputFile = error "DynFlag outputFile not defined"
  , dynOutputFile = error "DynFlag dynOutputFile not defined"
  , outputHi = error "DynFlag outputHi not defined"
  , dynLibLoader = error "DynFlag dynLibLoader not defined"
  , dumpPrefix = error "DynFlag dumpPrefix not defined"
  , dumpPrefixForce = error "DynFlag dumpPrefixForce not defined"
  , ldInputs = error "DynFlag ldInputs not defined"
  , classPaths = error "DynFlag classPaths not defined"
  , jarInputs = error "DynFlag jarInputs not defined"
  , includePaths = error "DynFlag includePaths not defined"
  , libraryPaths = error "DynFlag libraryPaths not defined"
  , frameworkPaths = error "DynFlag frameworkPaths not defined"
  , cmdlineFrameworks = error "DynFlag cmdlineFrameworks not defined"
  , rtsOpts = error "DynFlag rtsOpts not defined"
  , rtsOptsEnabled = error "DynFlag rtsOptsEnabled not defined"
  , hpcDir = error "DynFlag hpcDir not defined"
  , pluginModNames = error "DynFlag pluginModNames not defined"
  , pluginModNameOpts = error "DynFlag pluginModNameOpts not defined"
  , hooks = error "DynFlag hooks not defined"
  , depMakefile = error "DynFlag depMakefile not defined"
  , depIncludePkgDeps = error "DynFlag depIncludePkgDeps not defined"
  , depExcludeMods = error "DynFlag depExcludeMods not defined"
  , depSuffixes = error "DynFlag depSuffixes not defined"
  , packageDBFlags = error "DynFlag packageDBFlags not defined"
  , ignorePackageFlags = error "DynFlag ignorePackageFlags not defined"
  , packageFlags = error "DynFlag packageFlags not defined"
  , pluginPackageFlags = error "DynFlag pluginPackageFlags not defined"
  , trustFlags = error "DynFlag trustFlags not defined"
  , packageEnv = error "DynFlag packageEnv not defined"
  , pkgDatabase = error "DynFlag pkgDatabase not defined"
  , pkgState = error "DynFlag pkgState not defined"
  , filesToClean = error "DynFlag filesToClean not defined"
  , dirsToClean = error "DynFlag dirsToClean not defined"
  , filesToNotIntermediateClean = error "DynFlag filesToNotIntermediateClean not defined"
  , nextTempSuffix = error "DynFlag nextTempSuffix not defined"
  , generatedDumps = error "DynFlag generatedDumps not defined"
  , dumpFlags = error "DynFlag dumpFlags not defined"
  , generalFlags = error "DynFlag generalFlags not defined"
  , warningFlags = error "DynFlag warningFlags not defined"
  , language = error "DynFlag language not defined"
  , safeHaskell = error "DynFlag safeHaskell not defined"
  , safeInfer = error "DynFlag safeInfer not defined"
  , safeInferred = error "DynFlag safeInferred not defined"
  , thOnLoc = error "DynFlag thOnLoc not defined"
  , newDerivOnLoc = error "DynFlag newDerivOnLoc not defined"
  , overlapInstLoc = error "DynFlag overlapInstLoc not defined"
  , incoherentOnLoc = error "DynFlag incoherentOnLoc not defined"
  , pkgTrustOnLoc = error "DynFlag pkgTrustOnLoc not defined"
  , warnSafeOnLoc = error "DynFlag warnSafeOnLoc not defined"
  , warnUnsafeOnLoc = error "DynFlag warnUnsafeOnLoc not defined"
  , trustworthyOnLoc = error "DynFlag trustworthyOnLoc not defined"
  , extensions = error "DynFlag extensions not defined"
  , extensionFlags = error "DynFlag extensionFlags not defined"
  , ufCreationThreshold = error "DynFlag ufCreationThreshold not defined"
  , ufUseThreshold = error "DynFlag ufUseThreshold not defined"
  , ufFunAppDiscount = error "DynFlag ufFunAppDiscount not defined"
  , ufDictDiscount = error "DynFlag ufDictDiscount not defined"
  , ufKeenessFactor = error "DynFlag ufKeenessFactor not defined"
  , ufDearOp = error "DynFlag ufDearOp not defined"
  , maxWorkerArgs = error "DynFlag maxWorkerArgs not defined"
  , ghciHistSize = error "DynFlag ghciHistSize not defined"
  , log_action = error "DynFlag log_action not defined"
  , flushOut = error "DynFlag flushOut not defined"
  , flushErr = error "DynFlag flushErr not defined"
  , haddockOptions = error "DynFlag haddockOptions not defined"
  , ghciScripts = error "DynFlag ghciScripts not defined"
  , pprUserLength = error "DynFlag pprUserLength not defined"
  , pprCols = error "DynFlag pprCols not defined"
  , traceLevel = error "DynFlag traceLevel not defined"
  , useUnicode = error "DynFlag useUnicode not defined"
  , profAuto = error "DynFlag profAuto not defined"
  , interactivePrint = error "DynFlag interactivePrint not defined"
  , llvmVersion = error "DynFlag llvmVersion not defined"
  , nextWrapperNum = error "DynFlag nextWrapperNum not defined"
  , sseVersion = error "DynFlag sseVersion not defined"
  , avx = error "DynFlag avx not defined"
  , avx2 = error "DynFlag avx2 not defined"
  , avx512cd = error "DynFlag avx512cd not defined"
  , avx512er = error "DynFlag avx512er not defined"
  , avx512f = error "DynFlag avx512f not defined"
  , avx512pf = error "DynFlag avx512pf not defined"
  , rtldInfo = error "DynFlag rtldInfo not defined"
  , rtccInfo = error "DynFlag rtccInfo not defined"
  , maxInlineAllocSize = error "DynFlag maxInlineAllocSize not defined"
  , maxInlineMemcpyInsns = error "DynFlag maxInlineMemcpyInsns not defined"
  , maxInlineMemsetInsns = error "DynFlag maxInlineMemsetInsns not defined"
  , metrics = error "DynFlag metrics not defined"
  }
