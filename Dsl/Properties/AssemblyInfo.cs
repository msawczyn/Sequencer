#region Using directives

using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.ConstrainedExecution;

#endregion

//
// General Information about an assembly is controlled through the following 
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
//
[assembly: AssemblyTitle(@"")]
[assembly: AssemblyDescription(@"")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany(@"Sawczyn")]
[assembly: AssemblyProduct(@"Sequencer")]
[assembly: AssemblyCopyright("")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]
[assembly: System.Resources.NeutralResourcesLanguage("en")]

//
// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version 
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Revision and Build Numbers 
// by using the '*' as shown below:

[assembly: AssemblyVersion(@"1.0.0.0")]
[assembly: ComVisible(false)]
[assembly: CLSCompliant(true)]
[assembly: ReliabilityContract(Consistency.MayCorruptProcess, Cer.None)]

//
// Make the Dsl project internally visible to the DslPackage assembly
//
[assembly: InternalsVisibleTo(@"Sawczyn.Sequencer.DslPackage, PublicKey=0024000004800000940000000602000000240000525341310004000001000100D16257977EB1960C2EA9B90F54C201A41AEB22BCC5CA5B3478C50B4091ABCC9317AA061EF2488C2EAA491CCFCABCF5EB6F090F310FC7D6F89F8424EA54E55561C3F15236ED102492179CD9B9F5A807A5416079E2A46533E785D699B9F3B9AB555BC78A4F8EC4DD6D93115FD5AC3E0D465F7F6749548DBB948D46F201F97336EE")]