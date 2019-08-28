<?xml version="1.0" encoding="utf-8"?>
<Dsl xmlns:dm0="http://schemas.microsoft.com/VisualStudio/2008/DslTools/Core" dslVersion="1.0.0.0" Id="fd02d429-6bc8-41dc-bb75-9cb2d84780c4" Description="Sequence diagram representing a high level method call flow" Name="Sequencer" DisplayName="Sequence Diagram" Namespace="Sawczyn.Sequencer" MajorVersion="0" MinorVersion="1" ProductName="Sequencer" CompanyName="Sawczyn" PackageGuid="f653928c-67e8-4bc5-a1e1-558ebc689013" PackageNamespace="Sawczyn.Sequencer" xmlns="http://schemas.microsoft.com/VisualStudio/2005/DslTools/DslDefinitionModel">
  <Classes>
    <DomainClass Id="30e6ce39-1e74-4c94-8cf1-a8af7b4af056" Description="Overall base class that provides every element with a Name property which acts as its MonikerKey for serialization." Name="NamedElement" DisplayName="Named Element" InheritanceModifier="Abstract" Namespace="Sawczyn.Sequencer">
      <Properties>
        <DomainProperty Id="b558d316-ce43-412d-8667-d845ecb04195" Description="Description for Sawczyn.Sequencer.NamedElement.Name" Name="Name" DisplayName="Name" DefaultValue="" IsElementName="true">
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
        <DomainProperty Id="9865151d-e41c-4044-b3c3-45aa13738d4e" Description="Summary comments" Name="Description" DisplayName="Description" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="bea83729-130e-4534-bc3c-b88eb7d255bd" Description="Root element in which others are embedded." Name="SequenceDiagram" DisplayName="Sequence Diagram" Namespace="Sawczyn.Sequencer">
      <Notes>The ElementMergeDirectives specify what classes of element can be dropped onto this one in the editor, and what relationships that action will construct.
        Merges can also be invoked through the API, providing an alternative way to create embedding relationships.
      </Notes>
      <BaseClass>
        <DomainClassMoniker Name="NamedElement" />
      </BaseClass>
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
    <DomainClass Id="f14909b9-fa97-4696-9ea0-92a45c6915f7" Description="Elements that can be connected by Flow links." Name="FlowElement" DisplayName="Flow Element" InheritanceModifier="Abstract" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="NamedElement" />
      </BaseClass>
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
    <DomainClass Id="95b21624-2d8b-4c22-a120-62b10c08b936" Description="Method (function) called in a class" Name="Method" DisplayName="Method" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
      <Properties>
        <DomainProperty Id="ebb2fdf9-e7e3-4a38-9cb1-feff17a1b578" Description="If true, this is a static method" Name="IsStatic" DisplayName="Static">
          <Type>
            <ExternalTypeMoniker Name="/System/Boolean" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="f272d0ca-5925-46d7-816e-cbcc7bd6e14d" Description="" Name="StartPoint" DisplayName="Start Point" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="dc3df258-1ddd-4aad-8ecd-747ffbab2f8d" Description="End of the documented sequence" Name="EndPoint" DisplayName="End Point" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="4abaa0ce-6d9f-4498-9ce6-b797c7be3c7b" Description="Condition branch" Name="Branch" DisplayName="Branch" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
      <Properties>
        <DomainProperty Id="ce581e9b-9748-4d1d-a1f6-95b9e49107de" Description="Description for Sawczyn.Sequencer.Branch.Condition" Name="Condition" DisplayName="Condition">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="472aff60-370f-4cc4-8871-63fa556ad4f4" Description="" Name="Synchronization" DisplayName="Synchronization" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="2edf8064-010c-4ba1-84a1-a0be29c6096b" Description="Can be attached to any task flow element." Name="Comment" DisplayName="Comment" Namespace="Sawczyn.Sequencer">
      <Properties>
        <DomainProperty Id="3ab9bbf1-0881-4606-aa1e-d78b13150077" Description="" Name="Text" DisplayName="Text" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="193dad63-b4e8-4fed-a174-5775eeeb7a7f" Description="Represented by a swim lane on the diagram." Name="Class" DisplayName="Class" Namespace="Sawczyn.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="NamedElement" />
      </BaseClass>
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
  </Classes>
  <Relationships>
    <DomainRelationship Id="91cec0b4-ef09-4861-8bc9-2003ada86286" Description="Description for Sawczyn.Sequencer.Flow" Name="Flow" DisplayName="Flow" Namespace="Sawczyn.Sequencer">
      <Properties>
        <DomainProperty Id="52e92455-addc-422e-a43f-9ad8cc48d13c" Description="" Name="Guard" DisplayName="Guard" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
      <Source>
        <DomainRole Id="47639d7f-33f5-40d2-ada9-8a62fb3c0a59" Description="Description for Sawczyn.Sequencer.Flow.FlowFrom" Name="FlowFrom" DisplayName="Flow From" PropertyName="FlowTo" PropertyDisplayName="Flow To">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="1ca64ed3-f939-4ab4-baa5-0f588cecca4a" Description="Description for Sawczyn.Sequencer.Flow.FlowTo" Name="FlowTo" DisplayName="Flow To" PropertyName="FlowFrom" PropertyDisplayName="Flow From">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="f93c2a7b-4f8d-453d-b7a8-d9d926b2f818" Description="Description for Sawczyn.Sequencer.SequenceDiagramHasComments" Name="SequenceDiagramHasComments" DisplayName="Sequence Diagram Has Comments" Namespace="Sawczyn.Sequencer" IsEmbedding="true">
      <Source>
        <DomainRole Id="9a22e614-8060-4283-9cd9-0087f018596b" Description="Description for Sawczyn.Sequencer.SequenceDiagramHasComments.SequenceDiagram" Name="SequenceDiagram" DisplayName="Sequence Diagram" PropertyName="Comments" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Comments">
          <RolePlayer>
            <DomainClassMoniker Name="SequenceDiagram" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="11eb6d29-e992-432e-8b9e-60f405c730c2" Description="Description for Sawczyn.Sequencer.SequenceDiagramHasComments.Comment" Name="Comment" DisplayName="Comment" PropertyName="SequenceDiagram" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Sequence Diagram">
          <RolePlayer>
            <DomainClassMoniker Name="Comment" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="409cad13-4f15-4c9c-a829-824f1387f071" Description="The set of classes (represented by swim lanes) in the task flow." Name="SequenceDiagramHasClasses" DisplayName="Sequence Diagram Has Classes" Namespace="Sawczyn.Sequencer" IsEmbedding="true">
      <Source>
        <DomainRole Id="b948d22b-8abe-466d-8fca-03664cf3cf6b" Description="Description for Sawczyn.Sequencer.SequenceDiagramHasClasses.SequenceDiagram" Name="SequenceDiagram" DisplayName="Sequence Diagram" PropertyName="Classed" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Classed">
          <RolePlayer>
            <DomainClassMoniker Name="SequenceDiagram" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="95ae747b-7038-49e8-8709-ceaf3ae01865" Description="Description for Sawczyn.Sequencer.SequenceDiagramHasClasses.Class" Name="Class" DisplayName="Class" PropertyName="SequenceDiagram" Multiplicity="One" PropertyDisplayName="Sequence Diagram">
          <RolePlayer>
            <DomainClassMoniker Name="Class" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="23aa51a6-029f-465b-a4fd-23b480099b84" Description="Description for Sawczyn.Sequencer.CommentReferencesSubjects" Name="CommentReferencesSubjects" DisplayName="Comment References Subjects" Namespace="Sawczyn.Sequencer">
      <Source>
        <DomainRole Id="44310148-7dfc-4b30-9732-23880643a557" Description="Description for Sawczyn.Sequencer.CommentReferencesSubjects.Comment" Name="Comment" DisplayName="Comment" PropertyName="Subjects" PropertyDisplayName="Subjects">
          <RolePlayer>
            <DomainClassMoniker Name="Comment" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="c58292b0-c9eb-4b29-8366-47a1489c3502" Description="Description for Sawczyn.Sequencer.CommentReferencesSubjects.Subject" Name="Subject" DisplayName="Subject" PropertyName="Comments" PropertyDisplayName="Comments">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="b999641e-8fce-41ef-9de2-5cc3a76b70e1" Description="Description for Sawczyn.Sequencer.ClassHasFlowElements" Name="ClassHasFlowElements" DisplayName="Class Has Flow Elements" Namespace="Sawczyn.Sequencer" IsEmbedding="true">
      <Source>
        <DomainRole Id="fc37ca9a-2144-4510-96a8-f6ec85a8b10a" Description="Description for Sawczyn.Sequencer.ClassHasFlowElements.Class" Name="Class" DisplayName="Class" PropertyName="FlowElements" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Flow Elements">
          <RolePlayer>
            <DomainClassMoniker Name="Class" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="d4a9c985-41e9-4151-9e20-c8d03c9626c5" Description="Description for Sawczyn.Sequencer.ClassHasFlowElements.FlowElement" Name="FlowElement" DisplayName="Flow Element" PropertyName="Class" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Class">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
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
  </Types>
  <Shapes>
    <GeometryShape Id="d4d6c0d0-5262-4d75-b388-e2fe507c1674" Description="Description for Sawczyn.Sequencer.MethodShape" Name="MethodShape" DisplayName="Method Shape" Namespace="Sawczyn.Sequencer" FixedTooltipText="Method Shape" FillColor="213, 231, 205" InitialWidth="1.2" InitialHeight="0.35" OutlineThickness="0.01" FillGradientMode="Vertical" Geometry="RoundedRectangle">
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="Name" DisplayName="Name" DefaultText="Name" />
      </ShapeHasDecorators>
    </GeometryShape>
    <GeometryShape Id="a28a75a6-3401-42ce-8ade-58f442289ca7" Description="Description for Sawczyn.Sequencer.CommentBoxShape" Name="CommentBoxShape" DisplayName="Comment Box Shape" Namespace="Sawczyn.Sequencer" FixedTooltipText="Comment Box Shape" FillColor="255, 255, 204" OutlineColor="204, 204, 102" InitialHeight="0.3" OutlineThickness="0.01" FillGradientMode="None" Geometry="Rectangle">
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="Comment" DisplayName="Comment" DefaultText="Comment" />
      </ShapeHasDecorators>
    </GeometryShape>
    <ImageShape Id="0fe1f526-6e58-478d-be60-28d0e8133649" Description="Description for Sawczyn.Sequencer.BranchShape" Name="BranchShape" DisplayName="Branch Shape" Namespace="Sawczyn.Sequencer" FixedTooltipText="Branch Shape" InitialWidth="0.5" InitialHeight="0.3" OutlineThickness="0.01" Image="resources\decision.emf">
      <ShapeHasDecorators Position="OuterBottomCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="Condition" DisplayName="Condition" DefaultText="Condition" />
      </ShapeHasDecorators>
    </ImageShape>
    <ImageShape Id="4fdb204f-47b1-4f54-956e-d6ff9030c5ce" Description="Description for Sawczyn.Sequencer.EndShape" Name="EndShape" DisplayName="End Shape" Namespace="Sawczyn.Sequencer" FixedTooltipText="End Shape" InitialWidth="0.25" InitialHeight="0.25" OutlineThickness="0.01" Image="Resources\Stop.emf" />
    <ImageShape Id="4e2aa50c-71ea-427e-a26b-d3437a18734a" Description="Description for Sawczyn.Sequencer.StartShape" Name="StartShape" DisplayName="Start Shape" Namespace="Sawczyn.Sequencer" FixedTooltipText="Start Shape" InitialWidth="0.25" InitialHeight="0.25" OutlineThickness="0.01" Image="Resources\Start.emf" />
    <GeometryShape Id="d1434f42-7d66-4fd3-ad36-2e683b63c3e7" Description="Description for Sawczyn.Sequencer.SyncBarShape" Name="SyncBarShape" DisplayName="Sync Bar Shape" Namespace="Sawczyn.Sequencer" FixedTooltipText="Sync Bar Shape" FillColor="208, 207, 197" InitialWidth="1" InitialHeight="0.1" OutlineThickness="0.01" FillGradientMode="Vertical" Geometry="Rectangle" />
    <SwimLane Id="b7889f37-f7c0-44a7-9c8b-a8162be04469" Description="Description for Sawczyn.Sequencer.SwimLane" Name="SwimLane" DisplayName="Swim Lane" Namespace="Sawczyn.Sequencer" FixedTooltipText="Swim Lane" HeaderFillColor="LightBlue" InitialWidth="0" InitialHeight="0" SeparatorThickness="0.01">
      <Decorators>
        <SwimLaneHasDecorators Position="InnerTopCenter" HorizontalOffset="0" VerticalOffset="0">
          <TextDecorator Name="ClassName" DisplayName="Class Name" DefaultText="ClassName" FontSize="10" />
        </SwimLaneHasDecorators>
      </Decorators>
    </SwimLane>
  </Shapes>
  <Connectors>
    <Connector Id="3e249c3d-00ef-4146-9382-fc1b4daa0859" Description="Connects comments to their subject" Name="CommentConnector" DisplayName="Comment Connector" Namespace="Sawczyn.Sequencer" FixedTooltipText="Comment Connector" Color="113, 111, 110" DashStyle="Dot" Thickness="0.01" RoutingStyle="Straight" />
    <Connector Id="a93df324-bfc8-4902-9654-ca548e44aae9" Description="Connects activities" Name="FlowConnector" DisplayName="Flow Connector" Namespace="Sawczyn.Sequencer" FixedTooltipText="Flow Connector" Color="113, 111, 110" TargetEndStyle="EmptyArrow" Thickness="0.01" />
  </Connectors>
  <XmlSerializationBehavior Name="SequencerSerializationBehavior" Namespace="Sawczyn.Sequencer">
    <ClassData>
      <XmlClassData TypeName="NamedElement" MonikerAttributeName="name" SerializeId="true" MonikerElementName="namedElementMoniker" ElementName="namedElement" MonikerTypeName="NamedElementMoniker">
        <DomainClassMoniker Name="NamedElement" />
        <ElementData>
          <XmlPropertyData XmlName="name" IsMonikerKey="true">
            <DomainPropertyMoniker Name="NamedElement/Name" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="description">
            <DomainPropertyMoniker Name="NamedElement/Description" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="Flow" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowMoniker" ElementName="flow" MonikerTypeName="FlowMoniker">
        <DomainRelationshipMoniker Name="Flow" />
        <ElementData>
          <XmlPropertyData XmlName="guard">
            <DomainPropertyMoniker Name="Flow/Guard" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
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
          <XmlRelationshipData UseFullForm="true" RoleElementName="flowTo">
            <DomainRelationshipMoniker Name="Flow" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="Method" MonikerAttributeName="" SerializeId="true" MonikerElementName="methodMoniker" ElementName="method" MonikerTypeName="MethodMoniker">
        <DomainClassMoniker Name="Method" />
        <ElementData>
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
        <ElementData>
          <XmlPropertyData XmlName="condition">
            <DomainPropertyMoniker Name="Branch/Condition" />
          </XmlPropertyData>
        </ElementData>
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
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="SequenceDiagramHasClasses" MonikerAttributeName="" SerializeId="true" MonikerElementName="sequenceDiagramHasClassesMoniker" ElementName="sequenceDiagramHasClasses" MonikerTypeName="SequenceDiagramHasClassesMoniker">
        <DomainRelationshipMoniker Name="SequenceDiagramHasClasses" />
      </XmlClassData>
      <XmlClassData TypeName="MethodShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="methodShapeMoniker" ElementName="methodShape" MonikerTypeName="MethodShapeMoniker">
        <GeometryShapeMoniker Name="MethodShape" />
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
      <XmlClassData TypeName="FlowConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowConnectorMoniker" ElementName="flowConnector" MonikerTypeName="FlowConnectorMoniker">
        <ConnectorMoniker Name="FlowConnector" />
      </XmlClassData>
      <XmlClassData TypeName="Diagram" MonikerAttributeName="" SerializeId="true" MonikerElementName="diagramMoniker" ElementName="diagram" MonikerTypeName="DiagramMoniker">
        <DiagramMoniker Name="Diagram" />
      </XmlClassData>
      <XmlClassData TypeName="ClassHasFlowElements" MonikerAttributeName="" SerializeId="true" MonikerElementName="classHasFlowElementsMoniker" ElementName="classHasFlowElements" MonikerTypeName="ClassHasFlowElementsMoniker">
        <DomainRelationshipMoniker Name="ClassHasFlowElements" />
      </XmlClassData>
    </ClassData>
  </XmlSerializationBehavior>
  <ExplorerBehavior Name="SequencerExplorer" />
  <ConnectionBuilders>
    <ConnectionBuilder Name="FlowBuilder">
      <Notes>This ConnectionBuilder constructs the appropriate type of flow (Flow or ObjectFlow) between Tasks and Objects.</Notes>
      <LinkConnectDirective>
        <Notes>Flows can connect any SequencerElement to any other. But in this connection builder, 
        we are choosy about what we connect from and to. For example, you cannot connect from an EndPoint,
        nor to a StartPoint.</Notes>
        <DomainRelationshipMoniker Name="Flow" />
        <SourceDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Method" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Branch" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="StartPoint" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Synchronization" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </SourceDirectives>
        <TargetDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Method" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Branch" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="EndPoint" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Synchronization" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </TargetDirectives>
      </LinkConnectDirective>
    </ConnectionBuilder>
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
  </ConnectionBuilders>
  <Diagram Id="b68e6c42-4eb9-46a7-af2d-9e43de461561" Description="Sequende diagram" Name="Diagram" DisplayName="Sequence Diagram" Namespace="Sawczyn.Sequencer">
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
              <DomainPropertyMoniker Name="NamedElement/Name" />
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
              <DomainPropertyMoniker Name="NamedElement/Name" />
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
        <ConnectorMoniker Name="FlowConnector" />
        <DomainRelationshipMoniker Name="Flow" />
      </ConnectorMap>
      <ConnectorMap>
        <ConnectorMoniker Name="CommentConnector" />
        <DomainRelationshipMoniker Name="CommentReferencesSubjects" />
      </ConnectorMap>
    </ConnectorMaps>
  </Diagram>
  <Designer CopyPasteGeneration="CopyPasteOnly" FileExtension="sqc" EditorGuid="f293475e-75f9-456c-b012-d2274e3d4b87">
    <RootClass>
      <DomainClassMoniker Name="SequenceDiagram" />
    </RootClass>
    <XmlSerializationDefinition CustomPostLoad="false">
      <XmlSerializationBehaviorMoniker Name="SequencerSerializationBehavior" />
    </XmlSerializationDefinition>
    <ToolboxTab TabText="Sequencer">
      <ElementTool Name="Method" ToolboxIcon="resources\TaskTool.bmp" Caption="Method" Tooltip="Create a Method in a Class" HelpKeyword="CreateTaskF1Keyword">
        <DomainClassMoniker Name="Method" />
      </ElementTool>
      <ElementTool Name="StartPoint" ToolboxIcon="Resources\StartTool.bmp" Caption="Start Point" Tooltip="Create a Start Point" HelpKeyword="CreateStartStateF1Keyword">
        <DomainClassMoniker Name="StartPoint" />
      </ElementTool>
      <ElementTool Name="EndPoint" ToolboxIcon="Resources\EndTool.bmp" Caption="End Point" Tooltip="Create an End Point" HelpKeyword="CreateFinalStateF1Keyword">
        <DomainClassMoniker Name="EndPoint" />
      </ElementTool>
      <ElementTool Name="Branch" ToolboxIcon="resources\MergeBranchTool.bmp" Caption="Branch" Tooltip="Create a Branch" HelpKeyword="CreateMergeBranchF1Keyword">
        <DomainClassMoniker Name="Branch" />
      </ElementTool>
      <ElementTool Name="Synchronization" ToolboxIcon="resources\SyncBarTool.bmp" Caption="Synchronization" Tooltip="Create a Synchronization bar" HelpKeyword="Synchronization">
        <DomainClassMoniker Name="Synchronization" />
      </ElementTool>
      <ConnectionTool Name="MethodCall" ToolboxIcon="resources\FlowTool.bmp" Caption="Flow of Execution" Tooltip="Drag between Methods to create a Flow" HelpKeyword="ConnectFlowF1Keyword">
        <ConnectionBuilderMoniker Name="Sequencer/FlowBuilder" />
      </ConnectionTool>
      <ElementTool Name="Comment" ToolboxIcon="resources\CommentTool.bmp" Caption="Comment" Tooltip="Create a Comment" HelpKeyword="CreateCommentF1Keyword">
        <DomainClassMoniker Name="Comment" />
      </ElementTool>
      <ConnectionTool Name="CommentConnector" ToolboxIcon="resources\CommentConnectorTool.bmp" Caption="Comment Connector" Tooltip="Drag to link a Comment to its subjects" HelpKeyword="ConnectCommentSubjectsF1Keyword">
        <ConnectionBuilderMoniker Name="Sequencer/CommentReferencesSubjectsBuilder" />
      </ConnectionTool>
      <ElementTool Name="Class" ToolboxIcon="resources\SwimlaneTool.bmp" Caption="Class" Tooltip="Create a Class Swim Lane" HelpKeyword="Class">
        <DomainClassMoniker Name="Class" />
      </ElementTool>
    </ToolboxTab>
    <Validation UsesMenu="false" UsesOpen="false" UsesSave="false" UsesLoad="false" />
    <DiagramMoniker Name="Diagram" />
  </Designer>
  <Explorer ExplorerGuid="90838454-181a-432c-9005-d15b9a32a72c" Title="Sequencer Explorer">
    <ExplorerBehaviorMoniker Name="Sequencer/SequencerExplorer" />
  </Explorer>
</Dsl>