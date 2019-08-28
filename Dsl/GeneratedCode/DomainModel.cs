﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using DslModeling = global::Microsoft.VisualStudio.Modeling;
using DslDesign = global::Microsoft.VisualStudio.Modeling.Design;
using DslDiagrams = global::Microsoft.VisualStudio.Modeling.Diagrams;
namespace Sawczyn.Sequencer
{
	/// <summary>
	/// DomainModel SequencerDomainModel
	/// Description for Sawczyn.Sequencer.Sequencer
	/// </summary>
	[DslDesign::DisplayNameResource("Sawczyn.Sequencer.SequencerDomainModel.DisplayName", typeof(global::Sawczyn.Sequencer.SequencerDomainModel), "Sawczyn.Sequencer.GeneratedCode.DomainModelResx")]
	[DslDesign::DescriptionResource("Sawczyn.Sequencer.SequencerDomainModel.Description", typeof(global::Sawczyn.Sequencer.SequencerDomainModel), "Sawczyn.Sequencer.GeneratedCode.DomainModelResx")]
	[global::System.CLSCompliant(true)]
	[DslModeling::DependsOnDomainModel(typeof(global::Microsoft.VisualStudio.Modeling.CoreDomainModel))]
	[DslModeling::DependsOnDomainModel(typeof(global::Microsoft.VisualStudio.Modeling.Diagrams.CoreDesignSurfaceDomainModel))]
	[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1506:AvoidExcessiveClassCoupling", Justification = "Generated code.")]
	[DslModeling::DomainObjectId("748f2d08-552f-4b24-8ea4-75fc7ec180fc")]
	public partial class SequencerDomainModel : DslModeling::DomainModel
	{
		#region Constructor, domain model Id
	
		/// <summary>
		/// SequencerDomainModel domain model Id.
		/// </summary>
		public static readonly global::System.Guid DomainModelId = new global::System.Guid(0x748f2d08, 0x552f, 0x4b24, 0x8e, 0xa4, 0x75, 0xfc, 0x7e, 0xc1, 0x80, 0xfc);
	
		/// <summary>
		/// Constructor.
		/// </summary>
		/// <param name="store">Store containing the domain model.</param>
		public SequencerDomainModel(DslModeling::Store store)
			: base(store, DomainModelId)
		{
			// Call the partial method to allow any required serialization setup to be done.
			this.InitializeSerialization(store);		
		}
		
	
		///<Summary>
		/// Defines a partial method that will be called from the constructor to
		/// allow any necessary serialization setup to be done.
		///</Summary>
		///<remarks>
		/// For a DSL created with the DSL Designer wizard, an implementation of this 
		/// method will be generated in the GeneratedCode\SerializationHelper.cs class.
		///</remarks>
		partial void InitializeSerialization(DslModeling::Store store);
	
	
		#endregion
		#region Domain model reflection
			
		/// <summary>
		/// Gets the list of generated domain model types (classes, rules, relationships).
		/// </summary>
		/// <returns>List of types.</returns>
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1506:AvoidExcessiveClassCoupling", Justification = "Generated code.")]	
		protected sealed override global::System.Type[] GetGeneratedDomainModelTypes()
		{
			return new global::System.Type[]
			{
				typeof(SequenceDiagram),
				typeof(FlowElement),
				typeof(Method),
				typeof(StartPoint),
				typeof(EndPoint),
				typeof(Branch),
				typeof(Synchronization),
				typeof(Comment),
				typeof(Class),
				typeof(Callable),
				typeof(SequenceDiagramHasComments),
				typeof(SequenceDiagramHasClasses),
				typeof(CommentReferencesSubjects),
				typeof(ClassHasFlowElements),
				typeof(FlowElementsCallCallables),
				typeof(CallablesReturnResults),
				typeof(SequencerDiagram),
				typeof(CommentConnector),
				typeof(CallConnector),
				typeof(ResultConnector),
				typeof(SwimLane),
				typeof(MethodShape),
				typeof(CommentBoxShape),
				typeof(SyncBarShape),
				typeof(BranchShape),
				typeof(EndShape),
				typeof(StartShape),
				typeof(global::Sawczyn.Sequencer.FixUpDiagram),
				typeof(global::Sawczyn.Sequencer.DecoratorPropertyChanged),
				typeof(global::Sawczyn.Sequencer.ConnectorRolePlayerChanged),
			};
		}
		/// <summary>
		/// Gets the list of generated domain properties.
		/// </summary>
		/// <returns>List of property data.</returns>
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1506:AvoidExcessiveClassCoupling", Justification = "Generated code.")]	
		protected sealed override DomainMemberInfo[] GetGeneratedDomainProperties()
		{
			return new DomainMemberInfo[]
			{
				new DomainMemberInfo(typeof(Method), "Name", Method.NameDomainPropertyId, typeof(Method.NamePropertyHandler)),
				new DomainMemberInfo(typeof(Method), "IsStatic", Method.IsStaticDomainPropertyId, typeof(Method.IsStaticPropertyHandler)),
				new DomainMemberInfo(typeof(Comment), "Text", Comment.TextDomainPropertyId, typeof(Comment.TextPropertyHandler)),
				new DomainMemberInfo(typeof(Class), "Name", Class.NameDomainPropertyId, typeof(Class.NamePropertyHandler)),
				new DomainMemberInfo(typeof(Class), "Assembly", Class.AssemblyDomainPropertyId, typeof(Class.AssemblyPropertyHandler)),
				new DomainMemberInfo(typeof(Callable), "ReturnType", Callable.ReturnTypeDomainPropertyId, typeof(Callable.ReturnTypePropertyHandler)),
				new DomainMemberInfo(typeof(Callable), "Condition", Callable.ConditionDomainPropertyId, typeof(Callable.ConditionPropertyHandler)),
				new DomainMemberInfo(typeof(FlowElementsCallCallables), "IsAsync", FlowElementsCallCallables.IsAsyncDomainPropertyId, typeof(FlowElementsCallCallables.IsAsyncPropertyHandler)),
				new DomainMemberInfo(typeof(SequencerDiagram), "FillColor", SequencerDiagram.FillColorDomainPropertyId, typeof(SequencerDiagram.FillColorPropertyHandler)),
				new DomainMemberInfo(typeof(MethodShape), "FillColor", MethodShape.FillColorDomainPropertyId, typeof(MethodShape.FillColorPropertyHandler)),
			};
		}
		/// <summary>
		/// Gets the list of generated domain roles.
		/// </summary>
		/// <returns>List of role data.</returns>
		protected sealed override DomainRolePlayerInfo[] GetGeneratedDomainRoles()
		{
			return new DomainRolePlayerInfo[]
			{
				new DomainRolePlayerInfo(typeof(SequenceDiagramHasComments), "SequenceDiagram", SequenceDiagramHasComments.SequenceDiagramDomainRoleId),
				new DomainRolePlayerInfo(typeof(SequenceDiagramHasComments), "Comment", SequenceDiagramHasComments.CommentDomainRoleId),
				new DomainRolePlayerInfo(typeof(SequenceDiagramHasClasses), "SequenceDiagram", SequenceDiagramHasClasses.SequenceDiagramDomainRoleId),
				new DomainRolePlayerInfo(typeof(SequenceDiagramHasClasses), "Class", SequenceDiagramHasClasses.ClassDomainRoleId),
				new DomainRolePlayerInfo(typeof(CommentReferencesSubjects), "Comment", CommentReferencesSubjects.CommentDomainRoleId),
				new DomainRolePlayerInfo(typeof(CommentReferencesSubjects), "Subject", CommentReferencesSubjects.SubjectDomainRoleId),
				new DomainRolePlayerInfo(typeof(ClassHasFlowElements), "Class", ClassHasFlowElements.ClassDomainRoleId),
				new DomainRolePlayerInfo(typeof(ClassHasFlowElements), "FlowElement", ClassHasFlowElements.FlowElementDomainRoleId),
				new DomainRolePlayerInfo(typeof(FlowElementsCallCallables), "FlowElement", FlowElementsCallCallables.FlowElementDomainRoleId),
				new DomainRolePlayerInfo(typeof(FlowElementsCallCallables), "Callable", FlowElementsCallCallables.CallableDomainRoleId),
				new DomainRolePlayerInfo(typeof(CallablesReturnResults), "SourceCallable", CallablesReturnResults.SourceCallableDomainRoleId),
				new DomainRolePlayerInfo(typeof(CallablesReturnResults), "TargetCallable", CallablesReturnResults.TargetCallableDomainRoleId),
			};
		}
		#endregion
		#region Factory methods
		private static global::System.Collections.Generic.Dictionary<global::System.Type, int> createElementMap;
	
		/// <summary>
		/// Creates an element of specified type.
		/// </summary>
		/// <param name="partition">Partition where element is to be created.</param>
		/// <param name="elementType">Element type which belongs to this domain model.</param>
		/// <param name="propertyAssignments">New element property assignments.</param>
		/// <returns>Created element.</returns>
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1506:AvoidExcessiveClassCoupling", Justification = "Generated code.")]	
		public sealed override DslModeling::ModelElement CreateElement(DslModeling::Partition partition, global::System.Type elementType, DslModeling::PropertyAssignment[] propertyAssignments)
		{
			if (elementType == null) throw new global::System.ArgumentNullException("elementType");
	
			if (createElementMap == null)
			{
				createElementMap = new global::System.Collections.Generic.Dictionary<global::System.Type, int>(21);
				createElementMap.Add(typeof(SequenceDiagram), 0);
				createElementMap.Add(typeof(Method), 1);
				createElementMap.Add(typeof(StartPoint), 2);
				createElementMap.Add(typeof(EndPoint), 3);
				createElementMap.Add(typeof(Branch), 4);
				createElementMap.Add(typeof(Synchronization), 5);
				createElementMap.Add(typeof(Comment), 6);
				createElementMap.Add(typeof(Class), 7);
				createElementMap.Add(typeof(SequencerDiagram), 8);
				createElementMap.Add(typeof(CommentConnector), 9);
				createElementMap.Add(typeof(CallConnector), 10);
				createElementMap.Add(typeof(ResultConnector), 11);
				createElementMap.Add(typeof(SwimLane), 12);
				createElementMap.Add(typeof(MethodShape), 13);
				createElementMap.Add(typeof(CommentBoxShape), 14);
				createElementMap.Add(typeof(SyncBarShape), 15);
				createElementMap.Add(typeof(BranchShape), 16);
				createElementMap.Add(typeof(EndShape), 17);
				createElementMap.Add(typeof(StartShape), 18);
			}
			int index;
			if (!createElementMap.TryGetValue(elementType, out index))
			{
				// construct exception error message		
				string exceptionError = string.Format(
								global::System.Globalization.CultureInfo.CurrentCulture,
								global::Sawczyn.Sequencer.SequencerDomainModel.SingletonResourceManager.GetString("UnrecognizedElementType"),
								elementType.Name);
				throw new global::System.ArgumentException(exceptionError, "elementType");
			}
			switch (index)
			{
				case 0: return new SequenceDiagram(partition, propertyAssignments);
				case 1: return new Method(partition, propertyAssignments);
				case 2: return new StartPoint(partition, propertyAssignments);
				case 3: return new EndPoint(partition, propertyAssignments);
				case 4: return new Branch(partition, propertyAssignments);
				case 5: return new Synchronization(partition, propertyAssignments);
				case 6: return new Comment(partition, propertyAssignments);
				case 7: return new Class(partition, propertyAssignments);
				case 8: return new SequencerDiagram(partition, propertyAssignments);
				case 9: return new CommentConnector(partition, propertyAssignments);
				case 10: return new CallConnector(partition, propertyAssignments);
				case 11: return new ResultConnector(partition, propertyAssignments);
				case 12: return new SwimLane(partition, propertyAssignments);
				case 13: return new MethodShape(partition, propertyAssignments);
				case 14: return new CommentBoxShape(partition, propertyAssignments);
				case 15: return new SyncBarShape(partition, propertyAssignments);
				case 16: return new BranchShape(partition, propertyAssignments);
				case 17: return new EndShape(partition, propertyAssignments);
				case 18: return new StartShape(partition, propertyAssignments);
				default: return null;
			}
		}
	
		private static global::System.Collections.Generic.Dictionary<global::System.Type, int> createElementLinkMap;
	
		/// <summary>
		/// Creates an element link of specified type.
		/// </summary>
		/// <param name="partition">Partition where element is to be created.</param>
		/// <param name="elementLinkType">Element link type which belongs to this domain model.</param>
		/// <param name="roleAssignments">List of relationship role assignments for the new link.</param>
		/// <param name="propertyAssignments">New element property assignments.</param>
		/// <returns>Created element link.</returns>
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
		public sealed override DslModeling::ElementLink CreateElementLink(DslModeling::Partition partition, global::System.Type elementLinkType, DslModeling::RoleAssignment[] roleAssignments, DslModeling::PropertyAssignment[] propertyAssignments)
		{
			if (elementLinkType == null) throw new global::System.ArgumentNullException("elementLinkType");
			if (roleAssignments == null) throw new global::System.ArgumentNullException("roleAssignments");
	
			if (createElementLinkMap == null)
			{
				createElementLinkMap = new global::System.Collections.Generic.Dictionary<global::System.Type, int>(6);
				createElementLinkMap.Add(typeof(SequenceDiagramHasComments), 0);
				createElementLinkMap.Add(typeof(SequenceDiagramHasClasses), 1);
				createElementLinkMap.Add(typeof(CommentReferencesSubjects), 2);
				createElementLinkMap.Add(typeof(ClassHasFlowElements), 3);
				createElementLinkMap.Add(typeof(FlowElementsCallCallables), 4);
				createElementLinkMap.Add(typeof(CallablesReturnResults), 5);
			}
			int index;
			if (!createElementLinkMap.TryGetValue(elementLinkType, out index))
			{
				// construct exception error message
				string exceptionError = string.Format(
								global::System.Globalization.CultureInfo.CurrentCulture,
								global::Sawczyn.Sequencer.SequencerDomainModel.SingletonResourceManager.GetString("UnrecognizedElementLinkType"),
								elementLinkType.Name);
				throw new global::System.ArgumentException(exceptionError, "elementLinkType");
			
			}
			switch (index)
			{
				case 0: return new SequenceDiagramHasComments(partition, roleAssignments, propertyAssignments);
				case 1: return new SequenceDiagramHasClasses(partition, roleAssignments, propertyAssignments);
				case 2: return new CommentReferencesSubjects(partition, roleAssignments, propertyAssignments);
				case 3: return new ClassHasFlowElements(partition, roleAssignments, propertyAssignments);
				case 4: return new FlowElementsCallCallables(partition, roleAssignments, propertyAssignments);
				case 5: return new CallablesReturnResults(partition, roleAssignments, propertyAssignments);
				default: return null;
			}
		}
		#endregion
		#region Resource manager
		
		private static global::System.Resources.ResourceManager resourceManager;
		
		/// <summary>
		/// The base name of this model's resources.
		/// </summary>
		public const string ResourceBaseName = "Sawczyn.Sequencer.GeneratedCode.DomainModelResx";
		
		/// <summary>
		/// Gets the DomainModel's ResourceManager. If the ResourceManager does not already exist, then it is created.
		/// </summary>
		public override global::System.Resources.ResourceManager ResourceManager
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				return SequencerDomainModel.SingletonResourceManager;
			}
		}
	
		/// <summary>
		/// Gets the Singleton ResourceManager for this domain model.
		/// </summary>
		public static global::System.Resources.ResourceManager SingletonResourceManager
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				if (SequencerDomainModel.resourceManager == null)
				{
					SequencerDomainModel.resourceManager = new global::System.Resources.ResourceManager(ResourceBaseName, typeof(SequencerDomainModel).Assembly);
				}
				return SequencerDomainModel.resourceManager;
			}
		}
		#endregion
		#region Copy/Remove closures
		/// <summary>
		/// CopyClosure cache
		/// </summary>
		private static DslModeling::IElementVisitorFilter copyClosure;
		/// <summary>
		/// DeleteClosure cache
		/// </summary>
		private static DslModeling::IElementVisitorFilter removeClosure;
		/// <summary>
		/// Returns an IElementVisitorFilter that corresponds to the ClosureType.
		/// </summary>
		/// <param name="type">closure type</param>
		/// <param name="rootElements">collection of root elements</param>
		/// <returns>IElementVisitorFilter or null</returns>
		public override DslModeling::IElementVisitorFilter GetClosureFilter(DslModeling::ClosureType type, global::System.Collections.Generic.ICollection<DslModeling::ModelElement> rootElements)
		{
			switch (type)
			{
				case DslModeling::ClosureType.CopyClosure:
					return SequencerDomainModel.CopyClosure;
				case DslModeling::ClosureType.DeleteClosure:
					return SequencerDomainModel.DeleteClosure;
			}
			return base.GetClosureFilter(type, rootElements);
		}
		/// <summary>
		/// CopyClosure cache
		/// </summary>
		private static DslModeling::IElementVisitorFilter CopyClosure
		{
			get
			{
				// Incorporate all of the closures from the models we extend
				if (SequencerDomainModel.copyClosure == null)
				{
					DslModeling::ChainingElementVisitorFilter copyFilter = new DslModeling::ChainingElementVisitorFilter();
					copyFilter.AddFilter(new SequencerCopyClosure());
					copyFilter.AddFilter(new DslModeling::CoreCopyClosure());
					copyFilter.AddFilter(new DslDiagrams::CoreDesignSurfaceCopyClosure());
					
					SequencerDomainModel.copyClosure = copyFilter;
				}
				return SequencerDomainModel.copyClosure;
			}
		}
		/// <summary>
		/// DeleteClosure cache
		/// </summary>
		private static DslModeling::IElementVisitorFilter DeleteClosure
		{
			get
			{
				// Incorporate all of the closures from the models we extend
				if (SequencerDomainModel.removeClosure == null)
				{
					DslModeling::ChainingElementVisitorFilter removeFilter = new DslModeling::ChainingElementVisitorFilter();
					removeFilter.AddFilter(new SequencerDeleteClosure());
					removeFilter.AddFilter(new DslModeling::CoreDeleteClosure());
					removeFilter.AddFilter(new DslDiagrams::CoreDesignSurfaceDeleteClosure());
		
					SequencerDomainModel.removeClosure = removeFilter;
				}
				return SequencerDomainModel.removeClosure;
			}
		}
		#endregion
		#region Diagram rule helpers
		/// <summary>
		/// Enables rules in this domain model related to diagram fixup for the given store.
		/// If diagram data will be loaded into the store, this method should be called first to ensure
		/// that the diagram behaves properly.
		/// </summary>
		public static void EnableDiagramRules(DslModeling::Store store)
		{
			if(store == null) throw new global::System.ArgumentNullException("store");
			
			DslModeling::RuleManager ruleManager = store.RuleManager;
			ruleManager.EnableRule(typeof(global::Sawczyn.Sequencer.FixUpDiagram));
			ruleManager.EnableRule(typeof(global::Sawczyn.Sequencer.DecoratorPropertyChanged));
			ruleManager.EnableRule(typeof(global::Sawczyn.Sequencer.ConnectorRolePlayerChanged));
		}
		
		/// <summary>
		/// Disables rules in this domain model related to diagram fixup for the given store.
		/// </summary>
		public static void DisableDiagramRules(DslModeling::Store store)
		{
			if(store == null) throw new global::System.ArgumentNullException("store");
			
			DslModeling::RuleManager ruleManager = store.RuleManager;
			ruleManager.DisableRule(typeof(global::Sawczyn.Sequencer.FixUpDiagram));
			ruleManager.DisableRule(typeof(global::Sawczyn.Sequencer.DecoratorPropertyChanged));
			ruleManager.DisableRule(typeof(global::Sawczyn.Sequencer.ConnectorRolePlayerChanged));
		}
		#endregion
	}
		
	#region Copy/Remove closure classes
	/// <summary>
	/// Remove closure visitor filter
	/// </summary>
	[global::System.CLSCompliant(true)]
	public partial class SequencerDeleteClosure : SequencerDeleteClosureBase, DslModeling::IElementVisitorFilter
	{
		/// <summary>
		/// Constructor
		/// </summary>
		public SequencerDeleteClosure() : base()
		{
		}
	}
	
	/// <summary>
	/// Base class for remove closure visitor filter
	/// </summary>
	[global::System.CLSCompliant(true)]
	public partial class SequencerDeleteClosureBase : DslModeling::IElementVisitorFilter
	{
		/// <summary>
		/// DomainRoles
		/// </summary>
		private global::System.Collections.Specialized.HybridDictionary domainRoles;
		/// <summary>
		/// Constructor
		/// </summary>
		public SequencerDeleteClosureBase()
		{
			#region Initialize DomainData Table
			DomainRoles.Add(global::Sawczyn.Sequencer.SequenceDiagramHasComments.CommentDomainRoleId, true);
			DomainRoles.Add(global::Sawczyn.Sequencer.ClassHasFlowElements.FlowElementDomainRoleId, true);
			#endregion
		}
		/// <summary>
		/// Called to ask the filter if a particular relationship from a source element should be included in the traversal
		/// </summary>
		/// <param name="walker">ElementWalker that is traversing the model</param>
		/// <param name="sourceElement">Model Element playing the source role</param>
		/// <param name="sourceRoleInfo">DomainRoleInfo of the role that the source element is playing in the relationship</param>
		/// <param name="domainRelationshipInfo">DomainRelationshipInfo for the ElementLink in question</param>
		/// <param name="targetRelationship">Relationship in question</param>
		/// <returns>Yes if the relationship should be traversed</returns>
		public virtual DslModeling::VisitorFilterResult ShouldVisitRelationship(DslModeling::ElementWalker walker, DslModeling::ModelElement sourceElement, DslModeling::DomainRoleInfo sourceRoleInfo, DslModeling::DomainRelationshipInfo domainRelationshipInfo, DslModeling::ElementLink targetRelationship)
		{
			return DslModeling::VisitorFilterResult.Yes;
		}
		/// <summary>
		/// Called to ask the filter if a particular role player should be Visited during traversal
		/// </summary>
		/// <param name="walker">ElementWalker that is traversing the model</param>
		/// <param name="sourceElement">Model Element playing the source role</param>
		/// <param name="elementLink">Element Link that forms the relationship to the role player in question</param>
		/// <param name="targetDomainRole">DomainRoleInfo of the target role</param>
		/// <param name="targetRolePlayer">Model Element that plays the target role in the relationship</param>
		/// <returns></returns>
		public virtual DslModeling::VisitorFilterResult ShouldVisitRolePlayer(DslModeling::ElementWalker walker, DslModeling::ModelElement sourceElement, DslModeling::ElementLink elementLink, DslModeling::DomainRoleInfo targetDomainRole, DslModeling::ModelElement targetRolePlayer)
		{
			if (targetDomainRole == null) throw new global::System.ArgumentNullException("targetDomainRole");
			return this.DomainRoles.Contains(targetDomainRole.Id) ? DslModeling::VisitorFilterResult.Yes : DslModeling::VisitorFilterResult.DoNotCare;
		}
		/// <summary>
		/// DomainRoles
		/// </summary>
		private global::System.Collections.Specialized.HybridDictionary DomainRoles
		{
			get
			{
				if (this.domainRoles == null)
				{
					this.domainRoles = new global::System.Collections.Specialized.HybridDictionary();
				}
				return this.domainRoles;
			}
		}
	
	}
	/// <summary>
	/// Copy closure visitor filter
	/// </summary>
	[global::System.CLSCompliant(true)]
	public partial class SequencerCopyClosure : SequencerCopyClosureBase, DslModeling::IElementVisitorFilter
	{
		/// <summary>
		/// Constructor
		/// </summary>
		public SequencerCopyClosure() : base()
		{
		}
	}
	/// <summary>
	/// Base class for copy closure visitor filter
	/// </summary>
	[global::System.CLSCompliant(true)]
	public partial class SequencerCopyClosureBase : DslModeling::CopyClosureFilter, DslModeling::IElementVisitorFilter
	{
		/// <summary>
		/// Constructor
		/// </summary>
		public SequencerCopyClosureBase():base()
		{
		}
	}
	#endregion
		
}
namespace Sawczyn.Sequencer
{
	/// <summary>
	/// DomainEnumeration: TaskSort
	/// Description for Sawczyn.Sequencer.TaskSort
	/// </summary>
	[global::System.CLSCompliant(true)]
	public enum TaskSort
	{
		/// <summary>
		/// Regular
		/// Description for Sawczyn.Sequencer.TaskSort.Regular
		/// </summary>
		[DslDesign::DescriptionResource("Sawczyn.Sequencer.TaskSort/Regular.Description", typeof(global::Sawczyn.Sequencer.SequencerDomainModel), "Sawczyn.Sequencer.GeneratedCode.DomainModelResx")]
		Regular = 0,
		/// <summary>
		/// SuperTask
		/// Description for Sawczyn.Sequencer.TaskSort.SuperTask
		/// </summary>
		[DslDesign::DescriptionResource("Sawczyn.Sequencer.TaskSort/SuperTask.Description", typeof(global::Sawczyn.Sequencer.SequencerDomainModel), "Sawczyn.Sequencer.GeneratedCode.DomainModelResx")]
		SuperTask = 1,
	}
}

