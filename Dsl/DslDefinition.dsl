<?xml version="1.0" encoding="utf-8"?>
<Dsl xmlns:dm0="http://schemas.microsoft.com/VisualStudio/2008/DslTools/Core" dslVersion="1.0.0.0" Id="748f2d08-552f-4b24-8ea4-75fc7ec180fc" Description="Description for Sawczyn.Sequencer.Sequencer" Name="Sequencer" DisplayName="Task Flow" Namespace="Sawczyn.Sequencer" ProductName="Sequencer" CompanyName="Sawczyn" PackageGuid="8841b298-1d28-4f8c-8fbd-7142afbe253c" PackageNamespace="Sawczyn.Sequencer" xmlns="http://schemas.microsoft.com/VisualStudio/2005/DslTools/DslDefinitionModel">
  <Classes>
    <DomainClass Id="006530fa-ee1b-4661-9948-0603c58ffe0c" Description="Root element in which others are embedded." Name="SequenceDiagram" DisplayName="Sequence Diagram" Namespace="Sawczyn.Sequencer">
      <Notes>The ElementMergeDirectives specify what classes of element can be dropped onto this one in the editor, and what relationships that action will construct.
        Merges can also be invoked through the API, providing an alternative way to create embedding relationships.
      </Notes>
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Notes>Enables comments to be dropped onto the diagram.</Notes>
          <Index>
            <DomainClassMoniker Name="Comment" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>SequenceDiagramHasComments.Comments</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
        <ElementMergeDirective>
          <Notes>Enables swimlanes (representing Actors) to be dropped onto the diagram.</Notes>
          <Index>
            <DomainClassMoniker Name="Class" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>SequenceDiagramHasClasses.Classed</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="6b2534e3-0986-43fa-b1b9-95d61b5fe940" Description="Elements that can be connected by Flow links." Name="FlowElement" DisplayName="Flow Element" InheritanceModifier="Abstract" Namespace="Sawczyn.Sequencer">
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Notes>Enables a Comment to be dropped onto an element and linked to it in one action.</Notes>
          <Index>
            <DomainClassMoniker Name="Comment" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>ClassHasFlowElements.Class/!Class/SequenceDiagramHasClasses.SequenceDiagram/!SequenceDiagram/SequenceDiagramHasComments.Comments</DomainPath>
            <DomainPath>CommentReferencesSubjects.Comments</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="772402eb-0be4-4f60-b20c-f4de33e1296d" Description="" Name="Method" DisplayName="Method" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="Callable" />
      </BaseClass>
      <Properties>
        <DomainProperty Id="5f728af3-5188-4754-9a4f-8c2cb842dad2" Description="Description for Sawczyn.Sequencer.Method.Name" Name="Name" DisplayName="Name" DefaultValue="" IsElementName="true">
          <Notes>
            The XmlPropertyData sets this property as the MonikerKey. It is therefore important that all the Name values are unique before the model is saved to file.
            The IsElementName attribute ensures that this property will be initialized uniquely.
            However, it does not prevent the user from setting different elements to have the same name, which would prevent saving.
            An alternative technique would be to use a property with type /System/Guid as the MonikerKey, which would be less susceptible to interference from the user;
            the downside is that monikers in the saved file would be less readable.
          </Notes>
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="3b2436de-e57f-4138-98c0-5497af2c1811" Description="If true, this is a static method" Name="IsStatic" DisplayName="Static">
          <Type>
            <ExternalTypeMoniker Name="/System/Boolean" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="172e1065-b774-4fe9-a636-b1b826fc02f4" Description="" Name="StartPoint" DisplayName="Start Point" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="d2517cdc-b6ed-4390-be79-6dbfd058d159" Description="" Name="EndPoint" DisplayName="End Point" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="c61b1bda-8b86-4ac9-aa39-b5b62221b45f" Description="" Name="Branch" DisplayName="Branch" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="Callable" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="fefab4a8-6905-4882-8bcf-9e7d765e30f7" Description="" Name="Synchronization" DisplayName="Synchronization" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="Callable" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="70392b8c-b46f-41a6-95e0-f964b3346ac6" Description="Can be attached to any task flow element." Name="Comment" DisplayName="Comment" Namespace="Sawczyn.Sequencer">
      <Properties>
        <DomainProperty Id="a1f90568-183f-4600-ab87-916e09f916ff" Description="" Name="Text" DisplayName="Text" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="03d47fa2-49ec-4bdc-966a-f3fd9a2ff69f" Description="Represented by a swim lane on the diagram." Name="Class" DisplayName="Class" Namespace="Sawczyn.Sequencer">
      <Properties>
        <DomainProperty Id="47607c73-b450-4318-ae2d-22f0c63a9e9c" Description="Description for Sawczyn.Sequencer.Class.Name" Name="Name" DisplayName="Name" DefaultValue="" IsElementName="true">
          <Notes>
            The XmlPropertyData sets this property as the MonikerKey. It is therefore important that all the Name values are unique before the model is saved to file.
            The IsElementName attribute ensures that this property will be initialized uniquely.
            However, it does not prevent the user from setting different elements to have the same name, which would prevent saving.
            An alternative technique would be to use a property with type /System/Guid as the MonikerKey, which would be less susceptible to interference from the user;
            the downside is that monikers in the saved file would be less readable.
          </Notes>
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="8b255d01-7e68-4b0a-9af2-d547be9beb79" Description="Description for Sawczyn.Sequencer.Class.Assembly" Name="Assembly" DisplayName="Assembly">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Notes>One link is created when a Comment is merged into an Actor:
            - the embedding link SequencerGraphHasComments, from the SequencerGraph to the Comment.
            The embedding link actually starts from the SequencerGraph that owns the Actor,
            so the first part of that path navigates to the owner from the Actor; the last segment defines the link to be created.
            Note that there is no link between the Actor and the Comment.
          </Notes>
          <Index>
            <DomainClassMoniker Name="Comment" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>SequenceDiagramHasClasses.SequenceDiagram/!SequenceDiagram/SequenceDiagramHasComments.Comments</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
        <ElementMergeDirective>
          <Notes>Enables swimlanes (representing Actors) to appear on the diagram.</Notes>
          <Index>
            <DomainClassMoniker Name="Class" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>SequenceDiagramHasClasses.SequenceDiagram/!SequenceDiagram/.Classed</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
        <ElementMergeDirective>
          <Index>
            <DomainClassMoniker Name="FlowElement" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>ClassHasFlowElements.FlowElements</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="20320173-a436-41a3-a161-e0e99e26ded6" Description="Description for Sawczyn.Sequencer.Callable" Name="Callable" DisplayName="Callable" InheritanceModifier="Abstract" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
      <Properties>
        <DomainProperty Id="595474ae-d29b-457b-a572-c4a8854da99a" Description="Description for Sawczyn.Sequencer.Callable.Return Type" Name="ReturnType" DisplayName="Return Type">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="637b74b1-c6f2-4219-87fb-dbf6a3cee6a9" Description="Description for Sawczyn.Sequencer.Callable.Condition" Name="Condition" DisplayName="Condition">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
  </Classes>
  <Relationships>
    <DomainRelationship Id="8cba5f0d-4e66-4534-9dcd-9bd3e105cbde" Description="Description for Sawczyn.Sequencer.SequenceDiagramHasComments" Name="SequenceDiagramHasComments" DisplayName="Sequence Diagram Has Comments" Namespace="Sawczyn.Sequencer" IsEmbedding="true">
      <Source>
        <DomainRole Id="5219c5b0-deb4-4763-a1b6-95fec7dc2a45" Description="Description for Sawczyn.Sequencer.SequenceDiagramHasComments.SequenceDiagram" Name="SequenceDiagram" DisplayName="Sequence Diagram" PropertyName="Comments" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Comments">
          <RolePlayer>
            <DomainClassMoniker Name="SequenceDiagram" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="4b7b34bf-25ae-4b9e-91ab-5408c6bfa722" Description="Description for Sawczyn.Sequencer.SequenceDiagramHasComments.Comment" Name="Comment" DisplayName="Comment" PropertyName="SequenceDiagram" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Sequence Diagram">
          <RolePlayer>
            <DomainClassMoniker Name="Comment" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="626eb8cd-b00c-4c89-ab96-432d2571a1e2" Description="The set of actors (represented by swim lanes) in the task flow." Name="SequenceDiagramHasClasses" DisplayName="Sequence Diagram Has Classes" Namespace="Sawczyn.Sequencer" IsEmbedding="true">
      <Source>
        <DomainRole Id="8d49b1ce-87b9-4b80-bada-5752f2784288" Description="Description for Sawczyn.Sequencer.SequenceDiagramHasClasses.SequenceDiagram" Name="SequenceDiagram" DisplayName="Sequence Diagram" PropertyName="Classed" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Classed">
          <RolePlayer>
            <DomainClassMoniker Name="SequenceDiagram" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="6d8c679d-fdba-4c92-a48b-0065f34d1eb9" Description="Description for Sawczyn.Sequencer.SequenceDiagramHasClasses.Class" Name="Class" DisplayName="Class" PropertyName="SequenceDiagram" Multiplicity="One" PropertyDisplayName="Sequence Diagram">
          <RolePlayer>
            <DomainClassMoniker Name="Class" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="f842afde-b5cf-4ac3-85be-694d355f478b" Description="Description for Sawczyn.Sequencer.CommentReferencesSubjects" Name="CommentReferencesSubjects" DisplayName="Comment References Subjects" Namespace="Sawczyn.Sequencer">
      <Source>
        <DomainRole Id="d9e024bd-b80a-4f73-8dc1-6864c9792eef" Description="Description for Sawczyn.Sequencer.CommentReferencesSubjects.Comment" Name="Comment" DisplayName="Comment" PropertyName="Subjects" PropertyDisplayName="Subjects">
          <RolePlayer>
            <DomainClassMoniker Name="Comment" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="2198b1d4-8277-4044-b969-ba12a8ba1087" Description="Description for Sawczyn.Sequencer.CommentReferencesSubjects.Subject" Name="Subject" DisplayName="Subject" PropertyName="Comments" PropertyDisplayName="Comments">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="2e49c774-a5ec-4c49-83d6-af0804062e68" Description="Description for Sawczyn.Sequencer.ClassHasFlowElements" Name="ClassHasFlowElements" DisplayName="Class Has Flow Elements" Namespace="Sawczyn.Sequencer" IsEmbedding="true">
      <Source>
        <DomainRole Id="32a862d2-be4d-4deb-bd43-57e48f8f46f3" Description="Description for Sawczyn.Sequencer.ClassHasFlowElements.Class" Name="Class" DisplayName="Class" PropertyName="FlowElements" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Flow Elements">
          <RolePlayer>
            <DomainClassMoniker Name="Class" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="66ed7de4-90a7-42e8-9605-8db388d28ab3" Description="Description for Sawczyn.Sequencer.ClassHasFlowElements.FlowElement" Name="FlowElement" DisplayName="Flow Element" PropertyName="Class" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Class">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="32b2e182-8cd9-44b9-ac87-b69671bd7d54" Description="Description for Sawczyn.Sequencer.FlowElementsCallCallables" Name="FlowElementsCallCallables" DisplayName="Flow Elements Call Callables" Namespace="Sawczyn.Sequencer">
      <Properties>
        <DomainProperty Id="bba76663-10bf-49c6-b597-bda157e04e27" Description="If true, call is asynchronous" Name="IsAsync" DisplayName="Async" DefaultValue="false">
          <Type>
            <ExternalTypeMoniker Name="/System/Boolean" />
          </Type>
        </DomainProperty>
      </Properties>
      <Source>
        <DomainRole Id="68cc3f48-d792-413b-b550-5105418f6ae5" Description="Description for Sawczyn.Sequencer.FlowElementsCallCallables.FlowElement" Name="FlowElement" DisplayName="Flow Element" PropertyName="CallTarget" PropertyDisplayName="Call Target">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="e3eeba99-b2c1-4df0-8c07-c96daf86ca70" Description="Description for Sawczyn.Sequencer.FlowElementsCallCallables.Callable" Name="Callable" DisplayName="Callable" PropertyName="CallSource" PropertyDisplayName="Call Source">
          <RolePlayer>
            <DomainClassMoniker Name="Callable" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="b111f5f5-f6cb-4110-bdfe-dca4e793030b" Description="Description for Sawczyn.Sequencer.CallablesReturnResults" Name="CallablesReturnResults" DisplayName="Callables Return Results" Namespace="Sawczyn.Sequencer">
      <Source>
        <DomainRole Id="84f9bd4c-18c1-4737-9e61-7dff433ef449" Description="Description for Sawczyn.Sequencer.CallablesReturnResults.SourceCallable" Name="SourceCallable" DisplayName="Source Callable" PropertyName="ResultTarget" PropertyDisplayName="Result Target">
          <RolePlayer>
            <DomainClassMoniker Name="Callable" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="e9c72606-8b87-49de-8d65-0ec478636c44" Description="Description for Sawczyn.Sequencer.CallablesReturnResults.TargetCallable" Name="TargetCallable" DisplayName="Target Callable" PropertyName="ResultSource" PropertyDisplayName="Result Source">
          <RolePlayer>
            <DomainClassMoniker Name="Callable" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
  </Relationships>
  <Types>
    <ExternalType Name="DateTime" Namespace="System" />
    <ExternalType Name="String" Namespace="System" />
    <ExternalType Name="Int16" Namespace="System" />
    <ExternalType Name="Int32" Namespace="System" />
    <ExternalType Name="Int64" Namespace="System" />
    <ExternalType Name="UInt16" Namespace="System" />
    <ExternalType Name="UInt32" Namespace="System" />
    <ExternalType Name="UInt64" Namespace="System" />
    <ExternalType Name="SByte" Namespace="System" />
    <ExternalType Name="Byte" Namespace="System" />
    <ExternalType Name="Double" Namespace="System" />
    <ExternalType Name="Single" Namespace="System" />
    <ExternalType Name="Guid" Namespace="System" />
    <ExternalType Name="Boolean" Namespace="System" />
    <ExternalType Name="Char" Namespace="System" />
    <DomainEnumeration Name="TaskSort" Namespace="Sawczyn.Sequencer" Description="Description for Sawczyn.Sequencer.TaskSort">
      <Literals>
        <EnumerationLiteral Description="Description for Sawczyn.Sequencer.TaskSort.Regular" Name="Regular" Value="0" />
        <EnumerationLiteral Description="Description for Sawczyn.Sequencer.TaskSort.SuperTask" Name="SuperTask" Value="1" />
      </Literals>
    </DomainEnumeration>
    <ExternalType Name="Color" Namespace="System.Drawing" />
  </Types>
  <Shapes>
    <GeometryShape Id="81201982-7782-46a7-9b85-b6a10629aa5c" Description="Description for Sawczyn.Sequencer.MethodShape" Name="MethodShape" DisplayName="Method Shape" Namespace="Sawczyn.Sequencer" FixedTooltipText="Method Shape" FillColor="213, 231, 205" InitialWidth="1.2" InitialHeight="0.35" OutlineThickness="0.01" FillGradientMode="Vertical" ExposesFillColorAsProperty="true" Geometry="RoundedRectangle">
      <Properties>
        <DomainProperty Id="f0fd2c3c-7ee7-47e6-a3f5-8d1f6cb63f66" Description="Description for Sawczyn.Sequencer.MethodShape.Fill Color" Name="FillColor" DisplayName="Fill Color" Kind="CustomStorage">
          <Type>
            <ExternalTypeMoniker Name="/System.Drawing/Color" />
          </Type>
        </DomainProperty>
      </Properties>
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="Name" DisplayName="Name" DefaultText="Name" />
      </ShapeHasDecorators>
    </GeometryShape>
    <GeometryShape Id="4f4d929a-16e9-4745-9064-fcd52c0e1ae7" Description="Description for Sawczyn.Sequencer.CommentBoxShape" Name="CommentBoxShape" DisplayName="Comment Box Shape" Namespace="Sawczyn.Sequencer" FixedTooltipText="Comment Box Shape" FillColor="255, 255, 204" OutlineColor="204, 204, 102" InitialHeight="0.3" OutlineThickness="0.01" FillGradientMode="None" Geometry="Rectangle">
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="Comment" DisplayName="Comment" DefaultText="Comment" />
      </ShapeHasDecorators>
    </GeometryShape>
    <ImageShape Id="38a41370-743a-40fe-8701-ce9e3afa19b0" Description="Description for Sawczyn.Sequencer.BranchShape" Name="BranchShape" DisplayName="Branch Shape" Namespace="Sawczyn.Sequencer" FixedTooltipText="Branch Shape" InitialWidth="0.5" InitialHeight="0.3" OutlineThickness="0.01" Image="resources\decision.emf" />
    <ImageShape Id="fa1333b5-02e3-4877-997f-6d7d8327704e" Description="Description for Sawczyn.Sequencer.EndShape" Name="EndShape" DisplayName="End Shape" Namespace="Sawczyn.Sequencer" FixedTooltipText="End Shape" InitialWidth="0.25" InitialHeight="0.25" OutlineThickness="0.01" Image="Resources\Stop.emf" />
    <ImageShape Id="859e5261-e04d-4ba0-8d61-c5fddaca06ad" Description="Description for Sawczyn.Sequencer.StartShape" Name="StartShape" DisplayName="Start Shape" Namespace="Sawczyn.Sequencer" FixedTooltipText="Start Shape" InitialWidth="0.25" InitialHeight="0.25" OutlineThickness="0.01" Image="Resources\Start.emf" />
    <GeometryShape Id="2195dbd5-47c8-430f-9c86-10921ddb3f60" Description="Description for Sawczyn.Sequencer.SyncBarShape" Name="SyncBarShape" DisplayName="Sync Bar Shape" Namespace="Sawczyn.Sequencer" FixedTooltipText="Sync Bar Shape" FillColor="208, 207, 197" InitialWidth="1" InitialHeight="0.1" OutlineThickness="0.01" FillGradientMode="Vertical" Geometry="Rectangle" />
    <SwimLane Id="da447f55-31a6-4844-ac7b-f9036a1e78d2" Description="Represents a .NET class in the project" Name="SwimLane" DisplayName="Class" Namespace="Sawczyn.Sequencer" FixedTooltipText="Class" HeaderFillColor="LightBlue" InitialWidth="0" InitialHeight="0" SeparatorThickness="0.01">
      <Decorators>
        <SwimLaneHasDecorators Position="InnerTopLeft" HorizontalOffset="0" VerticalOffset="0">
          <TextDecorator Name="ClassName" DisplayName="Class Name" DefaultText="ClassName" />
        </SwimLaneHasDecorators>
        <SwimLaneHasDecorators Position="InnerTopRight" HorizontalOffset="0" VerticalOffset="0">
          <TextDecorator Name="AssemblyName" DisplayName="Assembly Name" DefaultText="Assembly Name" FontStyle="Italic" />
        </SwimLaneHasDecorators>
      </Decorators>
    </SwimLane>
  </Shapes>
  <Connectors>
    <Connector Id="78fada04-1f26-4183-9b74-cfa926fabfe5" Description="Description for Sawczyn.Sequencer.CommentConnector" Name="CommentConnector" DisplayName="Comment Connector" Namespace="Sawczyn.Sequencer" FixedTooltipText="Comment Connector" Color="113, 111, 110" DashStyle="Dot" Thickness="0.01" RoutingStyle="Straight" />
    <Connector Id="3fc8df6c-cb09-48d0-ad06-c02329689c09" Description="Description for Sawczyn.Sequencer.CallConnector" Name="CallConnector" DisplayName="Call Connector" Namespace="Sawczyn.Sequencer" FixedTooltipText="Call Connector" Color="113, 111, 110" TargetEndStyle="EmptyArrow" Thickness="0.01">
      <ConnectorHasDecorators Position="SourceTop" OffsetFromShape="0" OffsetFromLine="0">
        <TextDecorator Name="Condition" DisplayName="Condition" DefaultText="Condition" />
      </ConnectorHasDecorators>
    </Connector>
    <Connector Id="1fa897fb-a333-4535-8d53-eb71e6a911b4" Description="Description for Sawczyn.Sequencer.ResultConnector" Name="ResultConnector" DisplayName="Result Connector" Namespace="Sawczyn.Sequencer" FixedTooltipText="Result Connector" Color="113, 111, 110" TargetEndStyle="EmptyArrow" Thickness="0.01">
      <ConnectorHasDecorators Position="SourceBottom" OffsetFromShape="0" OffsetFromLine="0">
        <TextDecorator Name="ReturnType" DisplayName="Return Type" DefaultText="ReturnType" />
      </ConnectorHasDecorators>
    </Connector>
  </Connectors>
  <XmlSerializationBehavior Name="SequencerSerializationBehavior" Namespace="Sawczyn.Sequencer">
    <ClassData>
      <XmlClassData TypeName="SequenceDiagramHasComments" MonikerAttributeName="" SerializeId="true" MonikerElementName="sequenceDiagramHasCommentsMoniker" ElementName="sequenceDiagramHasComments" MonikerTypeName="SequenceDiagramHasCommentsMoniker">
        <DomainRelationshipMoniker Name="SequenceDiagramHasComments" />
      </XmlClassData>
      <XmlClassData TypeName="CommentReferencesSubjects" MonikerAttributeName="" SerializeId="true" MonikerElementName="commentReferencesSubjectsMoniker" ElementName="commentReferencesSubjects" MonikerTypeName="CommentReferencesSubjectsMoniker">
        <DomainRelationshipMoniker Name="CommentReferencesSubjects" />
      </XmlClassData>
      <XmlClassData TypeName="SequenceDiagram" MonikerAttributeName="" SerializeId="true" MonikerElementName="sequenceDiagramMoniker" ElementName="sequenceDiagram" MonikerTypeName="SequenceDiagramMoniker">
        <DomainClassMoniker Name="SequenceDiagram" />
        <ElementData>
          <XmlRelationshipData RoleElementName="comments">
            <DomainRelationshipMoniker Name="SequenceDiagramHasComments" />
          </XmlRelationshipData>
          <XmlRelationshipData RoleElementName="classed">
            <DomainRelationshipMoniker Name="SequenceDiagramHasClasses" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="FlowElement" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowElementMoniker" ElementName="flowElement" MonikerTypeName="FlowElementMoniker">
        <DomainClassMoniker Name="FlowElement" />
        <ElementData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="callTarget">
            <DomainRelationshipMoniker Name="FlowElementsCallCallables" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="Method" MonikerAttributeName="" SerializeId="true" MonikerElementName="methodMoniker" ElementName="method" MonikerTypeName="MethodMoniker">
        <DomainClassMoniker Name="Method" />
        <ElementData>
          <XmlPropertyData XmlName="name">
            <DomainPropertyMoniker Name="Method/Name" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="isStatic">
            <DomainPropertyMoniker Name="Method/IsStatic" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="StartPoint" MonikerAttributeName="" SerializeId="true" MonikerElementName="startPointMoniker" ElementName="startPoint" MonikerTypeName="StartPointMoniker">
        <DomainClassMoniker Name="StartPoint" />
      </XmlClassData>
      <XmlClassData TypeName="EndPoint" MonikerAttributeName="" SerializeId="true" MonikerElementName="endPointMoniker" ElementName="endPoint" MonikerTypeName="EndPointMoniker">
        <DomainClassMoniker Name="EndPoint" />
      </XmlClassData>
      <XmlClassData TypeName="Branch" MonikerAttributeName="" SerializeId="true" MonikerElementName="branchMoniker" ElementName="branch" MonikerTypeName="BranchMoniker">
        <DomainClassMoniker Name="Branch" />
      </XmlClassData>
      <XmlClassData TypeName="Synchronization" MonikerAttributeName="" SerializeId="true" MonikerElementName="synchronizationMoniker" ElementName="synchronization" MonikerTypeName="SynchronizationMoniker">
        <DomainClassMoniker Name="Synchronization" />
      </XmlClassData>
      <XmlClassData TypeName="Comment" MonikerAttributeName="" SerializeId="true" MonikerElementName="commentMoniker" ElementName="comment" MonikerTypeName="CommentMoniker">
        <DomainClassMoniker Name="Comment" />
        <ElementData>
          <XmlPropertyData XmlName="text">
            <DomainPropertyMoniker Name="Comment/Text" />
          </XmlPropertyData>
          <XmlRelationshipData RoleElementName="subjects">
            <DomainRelationshipMoniker Name="CommentReferencesSubjects" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="Class" MonikerAttributeName="" SerializeId="true" MonikerElementName="classMoniker" ElementName="class" MonikerTypeName="ClassMoniker">
        <DomainClassMoniker Name="Class" />
        <ElementData>
          <XmlRelationshipData RoleElementName="flowElements">
            <DomainRelationshipMoniker Name="ClassHasFlowElements" />
          </XmlRelationshipData>
          <XmlPropertyData XmlName="name">
            <DomainPropertyMoniker Name="Class/Name" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="assembly">
            <DomainPropertyMoniker Name="Class/Assembly" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="SequenceDiagramHasClasses" MonikerAttributeName="" SerializeId="true" MonikerElementName="sequenceDiagramHasClassesMoniker" ElementName="sequenceDiagramHasClasses" MonikerTypeName="SequenceDiagramHasClassesMoniker">
        <DomainRelationshipMoniker Name="SequenceDiagramHasClasses" />
      </XmlClassData>
      <XmlClassData TypeName="MethodShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="methodShapeMoniker" ElementName="methodShape" MonikerTypeName="MethodShapeMoniker">
        <GeometryShapeMoniker Name="MethodShape" />
        <ElementData>
          <XmlPropertyData XmlName="fillColor">
            <DomainPropertyMoniker Name="MethodShape/FillColor" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="CommentBoxShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="commentBoxShapeMoniker" ElementName="commentBoxShape" MonikerTypeName="CommentBoxShapeMoniker">
        <GeometryShapeMoniker Name="CommentBoxShape" />
      </XmlClassData>
      <XmlClassData TypeName="BranchShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="branchShapeMoniker" ElementName="branchShape" MonikerTypeName="BranchShapeMoniker">
        <ImageShapeMoniker Name="BranchShape" />
      </XmlClassData>
      <XmlClassData TypeName="EndShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="endShapeMoniker" ElementName="endShape" MonikerTypeName="EndShapeMoniker">
        <ImageShapeMoniker Name="EndShape" />
      </XmlClassData>
      <XmlClassData TypeName="StartShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="startShapeMoniker" ElementName="startShape" MonikerTypeName="StartShapeMoniker">
        <ImageShapeMoniker Name="StartShape" />
      </XmlClassData>
      <XmlClassData TypeName="SyncBarShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="syncBarShapeMoniker" ElementName="syncBarShape" MonikerTypeName="SyncBarShapeMoniker">
        <GeometryShapeMoniker Name="SyncBarShape" />
      </XmlClassData>
      <XmlClassData TypeName="SwimLane" MonikerAttributeName="" SerializeId="true" MonikerElementName="swimLaneMoniker" ElementName="swimLane" MonikerTypeName="SwimLaneMoniker">
        <SwimLaneMoniker Name="SwimLane" />
      </XmlClassData>
      <XmlClassData TypeName="CommentConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="commentConnectorMoniker" ElementName="commentConnector" MonikerTypeName="CommentConnectorMoniker">
        <ConnectorMoniker Name="CommentConnector" />
      </XmlClassData>
      <XmlClassData TypeName="CallConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="callConnectorMoniker" ElementName="callConnector" MonikerTypeName="CallConnectorMoniker">
        <ConnectorMoniker Name="CallConnector" />
      </XmlClassData>
      <XmlClassData TypeName="SequencerDiagram" MonikerAttributeName="" SerializeId="true" MonikerElementName="sequencerDiagramMoniker" ElementName="sequencerDiagram" MonikerTypeName="SequencerDiagramMoniker">
        <DiagramMoniker Name="SequencerDiagram" />
        <ElementData>
          <XmlPropertyData XmlName="fillColor">
            <DomainPropertyMoniker Name="SequencerDiagram/FillColor" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="ClassHasFlowElements" MonikerAttributeName="" SerializeId="true" MonikerElementName="classHasFlowElementsMoniker" ElementName="classHasFlowElements" MonikerTypeName="ClassHasFlowElementsMoniker">
        <DomainRelationshipMoniker Name="ClassHasFlowElements" />
      </XmlClassData>
      <XmlClassData TypeName="ResultConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="resultConnectorMoniker" ElementName="resultConnector" MonikerTypeName="ResultConnectorMoniker">
        <ConnectorMoniker Name="ResultConnector" />
      </XmlClassData>
      <XmlClassData TypeName="Callable" MonikerAttributeName="" SerializeId="true" MonikerElementName="callableMoniker" ElementName="callable" MonikerTypeName="CallableMoniker">
        <DomainClassMoniker Name="Callable" />
        <ElementData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="resultTarget">
            <DomainRelationshipMoniker Name="CallablesReturnResults" />
          </XmlRelationshipData>
          <XmlPropertyData XmlName="returnType">
            <DomainPropertyMoniker Name="Callable/ReturnType" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="condition">
            <DomainPropertyMoniker Name="Callable/Condition" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="FlowElementsCallCallables" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowElementsCallCallablesMoniker" ElementName="flowElementsCallCallables" MonikerTypeName="FlowElementsCallCallablesMoniker">
        <DomainRelationshipMoniker Name="FlowElementsCallCallables" />
        <ElementData>
          <XmlPropertyData XmlName="isAsync">
            <DomainPropertyMoniker Name="FlowElementsCallCallables/IsAsync" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="CallablesReturnResults" MonikerAttributeName="" SerializeId="true" MonikerElementName="callablesReturnResultsMoniker" ElementName="callablesReturnResults" MonikerTypeName="CallablesReturnResultsMoniker">
        <DomainRelationshipMoniker Name="CallablesReturnResults" />
      </XmlClassData>
    </ClassData>
  </XmlSerializationBehavior>
  <ExplorerBehavior Name="SequencerExplorer" />
  <ConnectionBuilders>
    <ConnectionBuilder Name="CommentReferencesSubjectsBuilder">
      <LinkConnectDirective>
        <DomainRelationshipMoniker Name="CommentReferencesSubjects" />
        <SourceDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Comment" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </SourceDirectives>
        <TargetDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="FlowElement" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </TargetDirectives>
      </LinkConnectDirective>
    </ConnectionBuilder>
    <ConnectionBuilder Name="FlowElementsCallCallablesBuilder">
      <LinkConnectDirective>
        <DomainRelationshipMoniker Name="FlowElementsCallCallables" />
        <SourceDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="FlowElement" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </SourceDirectives>
        <TargetDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Callable" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </TargetDirectives>
      </LinkConnectDirective>
    </ConnectionBuilder>
    <ConnectionBuilder Name="CallablesReturnResultsBuilder">
      <LinkConnectDirective>
        <DomainRelationshipMoniker Name="CallablesReturnResults" />
        <SourceDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Callable" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </SourceDirectives>
        <TargetDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Callable" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </TargetDirectives>
      </LinkConnectDirective>
    </ConnectionBuilder>
  </ConnectionBuilders>
  <Diagram Id="6fb004cc-f0ce-4312-92e4-c821ab8a5330" Description="Description for Sawczyn.Sequencer.SequencerDiagram" Name="SequencerDiagram" DisplayName="Flow Diagram" Namespace="Sawczyn.Sequencer" ExposesFillColor="true">
    <Properties>
      <DomainProperty Id="192c0154-6473-4142-9d8c-4644a37fd4ba" Description="Description for Sawczyn.Sequencer.SequencerDiagram.Fill Color" Name="FillColor" DisplayName="Fill Color" Kind="CustomStorage">
        <Type>
          <ExternalTypeMoniker Name="/System.Drawing/Color" />
        </Type>
      </DomainProperty>
    </Properties>
    <Class>
      <DomainClassMoniker Name="SequenceDiagram" />
    </Class>
    <ShapeMaps>
      <ShapeMap>
        <DomainClassMoniker Name="Method" />
        <ParentElementPath>
          <DomainPath>ClassHasFlowElements.Class/!Class</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="MethodShape/Name" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Method/Name" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="MethodShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="Comment" />
        <ParentElementPath>
          <DomainPath>SequenceDiagramHasComments.SequenceDiagram/!SequenceDiagram</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="CommentBoxShape/Comment" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Comment/Text" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="CommentBoxShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="Branch" />
        <ParentElementPath>
          <DomainPath>ClassHasFlowElements.Class/!Class</DomainPath>
        </ParentElementPath>
        <ImageShapeMoniker Name="BranchShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="EndPoint" />
        <ParentElementPath>
          <DomainPath>ClassHasFlowElements.Class/!Class</DomainPath>
        </ParentElementPath>
        <ImageShapeMoniker Name="EndShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="StartPoint" />
        <ParentElementPath>
          <DomainPath>ClassHasFlowElements.Class/!Class</DomainPath>
        </ParentElementPath>
        <ImageShapeMoniker Name="StartShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="Synchronization" />
        <ParentElementPath>
          <DomainPath>ClassHasFlowElements.Class/!Class</DomainPath>
        </ParentElementPath>
        <GeometryShapeMoniker Name="SyncBarShape" />
      </ShapeMap>
      <SwimLaneMap>
        <DomainClassMoniker Name="Class" />
        <ParentElementPath>
          <DomainPath>SequenceDiagramHasClasses.SequenceDiagram/!SequenceDiagram</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="SwimLane/ClassName" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Class/Name" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <DecoratorMap>
          <TextDecoratorMoniker Name="SwimLane/AssemblyName" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Class/Assembly" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <SwimLane>
          <SwimLaneMoniker Name="SwimLane" />
        </SwimLane>
      </SwimLaneMap>
    </ShapeMaps>
    <ConnectorMaps>
      <ConnectorMap>
        <ConnectorMoniker Name="CommentConnector" />
        <DomainRelationshipMoniker Name="CommentReferencesSubjects" />
      </ConnectorMap>
      <ConnectorMap>
        <ConnectorMoniker Name="CallConnector" />
        <DomainRelationshipMoniker Name="FlowElementsCallCallables" />
        <DecoratorMap>
          <TextDecoratorMoniker Name="CallConnector/Condition" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Callable/Condition" />
              <DomainPath>FlowElementsCallCallables!Callable</DomainPath>
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
      </ConnectorMap>
      <ConnectorMap>
        <ConnectorMoniker Name="ResultConnector" />
        <DomainRelationshipMoniker Name="CallablesReturnResults" />
        <DecoratorMap>
          <TextDecoratorMoniker Name="ResultConnector/ReturnType" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Callable/ReturnType" />
              <DomainPath>CallablesReturnResults!TargetCallable</DomainPath>
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
      </ConnectorMap>
    </ConnectorMaps>
  </Diagram>
  <Designer CopyPasteGeneration="CopyPasteOnly" FileExtension="sqc" EditorGuid="a32e65c7-c29a-4411-83e5-7124bfb09c39">
    <RootClass>
      <DomainClassMoniker Name="SequenceDiagram" />
    </RootClass>
    <XmlSerializationDefinition CustomPostLoad="false">
      <XmlSerializationBehaviorMoniker Name="SequencerSerializationBehavior" />
    </XmlSerializationDefinition>
    <ToolboxTab TabText="Sequencer">
      <ElementTool Name="Method" ToolboxIcon="resources\TaskTool.bmp" Caption="Method" Tooltip="Create a Task" HelpKeyword="CreateTaskF1Keyword">
        <DomainClassMoniker Name="Method" />
      </ElementTool>
      <ElementTool Name="StartPoint" ToolboxIcon="Resources\StartTool.bmp" Caption="Start Point" Tooltip="Create a Start Point" HelpKeyword="CreateStartStateF1Keyword">
        <DomainClassMoniker Name="StartPoint" />
      </ElementTool>
      <ElementTool Name="EndPoint" ToolboxIcon="Resources\EndTool.bmp" Caption="End Point" Tooltip="End Point" HelpKeyword="CreateFinalStateF1Keyword">
        <DomainClassMoniker Name="EndPoint" />
      </ElementTool>
      <ElementTool Name="Branch" ToolboxIcon="resources\MergeBranchTool.bmp" Caption="Branch" Tooltip="Create a Merge/Branch" HelpKeyword="CreateMergeBranchF1Keyword">
        <DomainClassMoniker Name="Branch" />
      </ElementTool>
      <ElementTool Name="Synchronization" ToolboxIcon="resources\SyncBarTool.bmp" Caption="Synchronization" Tooltip="Create a Synchronization bar" HelpKeyword="Synchronization">
        <DomainClassMoniker Name="Synchronization" />
      </ElementTool>
      <ConnectionTool Name="Flow" ToolboxIcon="resources\FlowTool.bmp" Caption="Flow" Tooltip="Drag between Tasks to create a Flow" HelpKeyword="ConnectFlowF1Keyword">
        <ConnectionBuilderMoniker Name="Sequencer/FlowElementsCallCallablesBuilder" />
      </ConnectionTool>
      <ElementTool Name="Comment" ToolboxIcon="resources\CommentTool.bmp" Caption="Comment" Tooltip="Create a Comment" HelpKeyword="CreateCommentF1Keyword">
        <DomainClassMoniker Name="Comment" />
      </ElementTool>
      <ConnectionTool Name="CommentSubjects" ToolboxIcon="resources\CommentConnectorTool.bmp" Caption="Comment Connector" Tooltip="Drag to link a Comment to its subjects" HelpKeyword="ConnectCommentSubjectsF1Keyword">
        <ConnectionBuilderMoniker Name="Sequencer/CommentReferencesSubjectsBuilder" />
      </ConnectionTool>
      <ElementTool Name="Class" ToolboxIcon="resources\SwimlaneTool.bmp" Caption="Class" Tooltip="Create an Actor Swim Lane" HelpKeyword="Class">
        <DomainClassMoniker Name="Class" />
      </ElementTool>
    </ToolboxTab>
    <Validation UsesMenu="false" UsesOpen="false" UsesSave="false" UsesLoad="false" />
    <DiagramMoniker Name="SequencerDiagram" />
  </Designer>
  <Explorer ExplorerGuid="f7477cf3-6f23-4b76-a884-304a3d08c9fe" Title="Sequencer Explorer">
    <ExplorerBehaviorMoniker Name="Sequencer/SequencerExplorer" />
  </Explorer>
</Dsl>