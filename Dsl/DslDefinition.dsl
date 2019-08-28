<?xml version="1.0" encoding="utf-8"?>
<Dsl xmlns:dm0="http://schemas.microsoft.com/VisualStudio/2008/DslTools/Core" dslVersion="1.0.0.0" Id="fd02d429-6bc8-41dc-bb75-9cb2d84780c4" Description="Description for Company.Sequencer.Sequencer" Name="Sequencer" DisplayName="Task Flow" Namespace="Company.Sequencer" ProductName="Sequencer" CompanyName="Company" PackageGuid="f653928c-67e8-4bc5-a1e1-558ebc689013" PackageNamespace="Company.Sequencer" xmlns="http://schemas.microsoft.com/VisualStudio/2005/DslTools/DslDefinitionModel">
  <Classes>
    <DomainClass Id="30e6ce39-1e74-4c94-8cf1-a8af7b4af056" Description="Overall base class that provides every element with a Name property which acts as its MonikerKey for serialization." Name="NamedElement" DisplayName="Named Element" InheritanceModifier="Abstract" Namespace="Company.Sequencer">
      <Properties>
        <DomainProperty Id="b558d316-ce43-412d-8667-d845ecb04195" Description="Description for Company.Sequencer.NamedElement.Name" Name="Name" DisplayName="Name" DefaultValue="" IsElementName="true">
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
      </Properties>
    </DomainClass>
    <DomainClass Id="bea83729-130e-4534-bc3c-b88eb7d255bd" Description="Root element in which others are embedded." Name="FlowGraph" DisplayName="Flow Graph" Namespace="Company.Sequencer">
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
            <DomainPath>FlowGraphHasComments.Comments</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
        <ElementMergeDirective>
          <Notes>Enables swimlanes (representing Actors) to be dropped onto the diagram.</Notes>
          <Index>
            <DomainClassMoniker Name="Actor" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>FlowGraphHasActors.Actors</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="f14909b9-fa97-4696-9ea0-92a45c6915f7" Description="Elements that can be connected by Flow links." Name="FlowElement" DisplayName="Flow Element" InheritanceModifier="Abstract" Namespace="Company.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="NamedElement" />
      </BaseClass>
      <Properties>
        <DomainProperty Id="9c078625-98fa-4f51-b3c4-df0f7fcf960b" Description="" Name="Description" DisplayName="Description" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Notes>Enables a Comment to be dropped onto an element and linked to it in one action.</Notes>
          <Index>
            <DomainClassMoniker Name="Comment" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>ActorHasFlowElements.Actor/!Actor/FlowGraphHasActors.FlowGraph/!FlowGraph/FlowGraphHasComments.Comments</DomainPath>
            <DomainPath>CommentReferencesSubjects.Comments</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="c7a401f3-f361-427d-af31-849e85c47f43" Description="Elements that can be connected by ObjectFlow links." Name="ObjectFlowElement" DisplayName="Object Flow Element" InheritanceModifier="Abstract" Namespace="Company.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="95b21624-2d8b-4c22-a120-62b10c08b936" Description="" Name="Task" DisplayName="Task" Namespace="Company.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="ObjectFlowElement" />
      </BaseClass>
      <Properties>
        <DomainProperty Id="46168c27-216b-4a30-8c7b-2d2cc228ef07" Description="" Name="NestedDiagram" DisplayName="Nested Diagram" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="8ff06a1b-f644-4d6f-be96-e21cdfce4446" Description="" Name="Sort" DisplayName="Sort" DefaultValue="Regular">
          <Type>
            <DomainEnumerationMoniker Name="TaskSort" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="f272d0ca-5925-46d7-816e-cbcc7bd6e14d" Description="" Name="StartPoint" DisplayName="Start Point" Namespace="Company.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="dc3df258-1ddd-4aad-8ecd-747ffbab2f8d" Description="" Name="Endpoint" DisplayName="Endpoint" Namespace="Company.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="4abaa0ce-6d9f-4498-9ce6-b797c7be3c7b" Description="" Name="MergeBranch" DisplayName="Merge Branch" Namespace="Company.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="472aff60-370f-4cc4-8871-63fa556ad4f4" Description="" Name="Synchronization" DisplayName="Synchronization" Namespace="Company.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="34f3a709-04f7-4fbc-8f5a-051e72de105a" Description="" Name="ObjectInState" DisplayName="Object In State" Namespace="Company.Sequencer">
      <BaseClass>
        <DomainClassMoniker Name="ObjectFlowElement" />
      </BaseClass>
      <Properties>
        <DomainProperty Id="29feb142-b42b-48ba-abed-474139d9cf49" Description="" Name="State" DisplayName="State" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="2edf8064-010c-4ba1-84a1-a0be29c6096b" Description="Can be attached to any task flow element." Name="Comment" DisplayName="Comment" Namespace="Company.Sequencer">
      <Properties>
        <DomainProperty Id="3ab9bbf1-0881-4606-aa1e-d78b13150077" Description="" Name="Text" DisplayName="Text" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="193dad63-b4e8-4fed-a174-5775eeeb7a7f" Description="Represented by a swim lane on the diagram." Name="Actor" DisplayName="Actor" Namespace="Company.Sequencer">
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
            <DomainPath>FlowGraphHasActors.FlowGraph/!FlowGraph/FlowGraphHasComments.Comments</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
        <ElementMergeDirective>
          <Notes>Enables swimlanes (representing Actors) to appear on the diagram.</Notes>
          <Index>
            <DomainClassMoniker Name="Actor" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>FlowGraphHasActors.FlowGraph/!FlowGraph/.Actors</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
        <ElementMergeDirective>
          <Index>
            <DomainClassMoniker Name="FlowElement" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>ActorHasFlowElements.FlowElements</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
  </Classes>
  <Relationships>
    <DomainRelationship Id="91cec0b4-ef09-4861-8bc9-2003ada86286" Description="Description for Company.Sequencer.Flow" Name="Flow" DisplayName="Flow" Namespace="Company.Sequencer">
      <Properties>
        <DomainProperty Id="52e92455-addc-422e-a43f-9ad8cc48d13c" Description="" Name="Guard" DisplayName="Guard" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
      <Source>
        <DomainRole Id="47639d7f-33f5-40d2-ada9-8a62fb3c0a59" Description="Description for Company.Sequencer.Flow.FlowFrom" Name="FlowFrom" DisplayName="Flow From" PropertyName="FlowTo" PropertyDisplayName="Flow To">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="1ca64ed3-f939-4ab4-baa5-0f588cecca4a" Description="Description for Company.Sequencer.Flow.FlowTo" Name="FlowTo" DisplayName="Flow To" PropertyName="FlowFrom" PropertyDisplayName="Flow From">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="f93c2a7b-4f8d-453d-b7a8-d9d926b2f818" Description="Description for Company.Sequencer.FlowGraphHasComments" Name="FlowGraphHasComments" DisplayName="Flow Graph Has Comments" Namespace="Company.Sequencer" IsEmbedding="true">
      <Source>
        <DomainRole Id="9a22e614-8060-4283-9cd9-0087f018596b" Description="Description for Company.Sequencer.FlowGraphHasComments.FlowGraph" Name="FlowGraph" DisplayName="Flow Graph" PropertyName="Comments" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Comments">
          <RolePlayer>
            <DomainClassMoniker Name="FlowGraph" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="11eb6d29-e992-432e-8b9e-60f405c730c2" Description="Description for Company.Sequencer.FlowGraphHasComments.Comment" Name="Comment" DisplayName="Comment" PropertyName="FlowGraph" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Flow Graph">
          <RolePlayer>
            <DomainClassMoniker Name="Comment" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="409cad13-4f15-4c9c-a829-824f1387f071" Description="The set of actors (represented by swim lanes) in the task flow." Name="FlowGraphHasActors" DisplayName="Flow Graph Has Actors" Namespace="Company.Sequencer" IsEmbedding="true">
      <Source>
        <DomainRole Id="b948d22b-8abe-466d-8fca-03664cf3cf6b" Description="Description for Company.Sequencer.FlowGraphHasActors.FlowGraph" Name="FlowGraph" DisplayName="Flow Graph" PropertyName="Actors" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Actors">
          <RolePlayer>
            <DomainClassMoniker Name="FlowGraph" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="95ae747b-7038-49e8-8709-ceaf3ae01865" Description="Description for Company.Sequencer.FlowGraphHasActors.Actor" Name="Actor" DisplayName="Actor" PropertyName="FlowGraph" Multiplicity="One" PropertyDisplayName="Flow Graph">
          <RolePlayer>
            <DomainClassMoniker Name="Actor" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="23aa51a6-029f-465b-a4fd-23b480099b84" Description="Description for Company.Sequencer.CommentReferencesSubjects" Name="CommentReferencesSubjects" DisplayName="Comment References Subjects" Namespace="Company.Sequencer">
      <Source>
        <DomainRole Id="44310148-7dfc-4b30-9732-23880643a557" Description="Description for Company.Sequencer.CommentReferencesSubjects.Comment" Name="Comment" DisplayName="Comment" PropertyName="Subjects" PropertyDisplayName="Subjects">
          <RolePlayer>
            <DomainClassMoniker Name="Comment" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="c58292b0-c9eb-4b29-8366-47a1489c3502" Description="Description for Company.Sequencer.CommentReferencesSubjects.Subject" Name="Subject" DisplayName="Subject" PropertyName="Comments" PropertyDisplayName="Comments">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="f0b6a4ef-73fb-4302-b482-44fefdcb392f" Description="Relationship between Tasks and ObjectInStates." Name="ObjectFlow" DisplayName="Object Flow" Namespace="Company.Sequencer">
      <Notes>Although this relationship allows links between any pair of elements, it is intended that there should be an ObjectInState at one end or both.
        The ConnectionBuilder for this relationship therefore imposes that restriction: an ObjectFlow link that doesn't involve an ObjectInState at either end
        can therefore not be constructed using the editor. However, it could be constructed through the API.
      </Notes>
      <Source>
        <DomainRole Id="59f69f02-9b9d-4ce9-b98a-e5bc4c06b7cd" Description="Description for Company.Sequencer.ObjectFlow.ObjectFlowTo" Name="ObjectFlowTo" DisplayName="Object Flow To" PropertyName="ObjectFlowFrom" PropertyDisplayName="Object Flow From">
          <RolePlayer>
            <DomainClassMoniker Name="ObjectFlowElement" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="4b24eebb-71f7-4323-a0dd-db1f9b7f5129" Description="Description for Company.Sequencer.ObjectFlow.ObjectFlowFrom" Name="ObjectFlowFrom" DisplayName="Object Flow From" PropertyName="ObjectFlowTo" PropertyDisplayName="Object Flow To">
          <RolePlayer>
            <DomainClassMoniker Name="ObjectFlowElement" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="b999641e-8fce-41ef-9de2-5cc3a76b70e1" Description="Description for Company.Sequencer.ActorHasFlowElements" Name="ActorHasFlowElements" DisplayName="Actor Has Flow Elements" Namespace="Company.Sequencer" IsEmbedding="true">
      <Source>
        <DomainRole Id="fc37ca9a-2144-4510-96a8-f6ec85a8b10a" Description="Description for Company.Sequencer.ActorHasFlowElements.Actor" Name="Actor" DisplayName="Actor" PropertyName="FlowElements" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Flow Elements">
          <RolePlayer>
            <DomainClassMoniker Name="Actor" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="d4a9c985-41e9-4151-9e20-c8d03c9626c5" Description="Description for Company.Sequencer.ActorHasFlowElements.FlowElement" Name="FlowElement" DisplayName="Flow Element" PropertyName="Actor" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Actor">
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
    <DomainEnumeration Name="TaskSort" Namespace="Company.Sequencer" Description="Description for Company.Sequencer.TaskSort">
      <Literals>
        <EnumerationLiteral Description="Description for Company.Sequencer.TaskSort.Regular" Name="Regular" Value="0" />
        <EnumerationLiteral Description="Description for Company.Sequencer.TaskSort.SuperTask" Name="SuperTask" Value="1" />
      </Literals>
    </DomainEnumeration>
  </Types>
  <Shapes>
    <GeometryShape Id="d4d6c0d0-5262-4d75-b388-e2fe507c1674" Description="Description for Company.Sequencer.TaskShape" Name="TaskShape" DisplayName="Task Shape" Namespace="Company.Sequencer" FixedTooltipText="Task Shape" FillColor="213, 231, 205" InitialWidth="1.2" InitialHeight="0.35" OutlineThickness="0.01" FillGradientMode="Vertical" Geometry="RoundedRectangle">
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="Name" DisplayName="Name" DefaultText="Name" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="InnerBottomRight" HorizontalOffset="0" VerticalOffset="0">
        <IconDecorator Name="SubTask" DisplayName="Sub Task" DefaultIcon="resources\SubTaskIcon.bmp" />
      </ShapeHasDecorators>
    </GeometryShape>
    <GeometryShape Id="a28a75a6-3401-42ce-8ade-58f442289ca7" Description="Description for Company.Sequencer.CommentBoxShape" Name="CommentBoxShape" DisplayName="Comment Box Shape" Namespace="Company.Sequencer" FixedTooltipText="Comment Box Shape" FillColor="255, 255, 204" OutlineColor="204, 204, 102" InitialHeight="0.3" OutlineThickness="0.01" FillGradientMode="None" Geometry="Rectangle">
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="Comment" DisplayName="Comment" DefaultText="Comment" />
      </ShapeHasDecorators>
    </GeometryShape>
    <ImageShape Id="0fe1f526-6e58-478d-be60-28d0e8133649" Description="Description for Company.Sequencer.MergeBranchShape" Name="MergeBranchShape" DisplayName="Merge Branch Shape" Namespace="Company.Sequencer" FixedTooltipText="Merge Branch Shape" InitialWidth="0.5" InitialHeight="0.3" OutlineThickness="0.01" Image="resources\decision.emf" />
    <ImageShape Id="4fdb204f-47b1-4f54-956e-d6ff9030c5ce" Description="Description for Company.Sequencer.EndShape" Name="EndShape" DisplayName="End Shape" Namespace="Company.Sequencer" FixedTooltipText="End Shape" InitialWidth="0.25" InitialHeight="0.25" OutlineThickness="0.01" Image="Resources\Stop.emf" />
    <ImageShape Id="4e2aa50c-71ea-427e-a26b-d3437a18734a" Description="Description for Company.Sequencer.StartShape" Name="StartShape" DisplayName="Start Shape" Namespace="Company.Sequencer" FixedTooltipText="Start Shape" InitialWidth="0.25" InitialHeight="0.25" OutlineThickness="0.01" Image="Resources\Start.emf" />
    <GeometryShape Id="d1434f42-7d66-4fd3-ad36-2e683b63c3e7" Description="Description for Company.Sequencer.SyncBarShape" Name="SyncBarShape" DisplayName="Sync Bar Shape" Namespace="Company.Sequencer" FixedTooltipText="Sync Bar Shape" FillColor="208, 207, 197" InitialWidth="1" InitialHeight="0.1" OutlineThickness="0.01" FillGradientMode="Vertical" Geometry="Rectangle" />
    <GeometryShape Id="d35da67a-9ae4-4198-aedd-2d07100cc675" Description="Description for Company.Sequencer.ObjectShape" Name="ObjectShape" DisplayName="Object Shape" Namespace="Company.Sequencer" FixedTooltipText="Object Shape" InitialWidth="1.2" InitialHeight="0.4" OutlineThickness="0.01" Geometry="Rectangle">
      <ShapeHasDecorators Position="InnerTopCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="Name" DisplayName="Name" DefaultText="Name" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="InnerBottomCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="State" DisplayName="State" DefaultText="State" FontStyle="Italic" />
      </ShapeHasDecorators>
    </GeometryShape>
    <SwimLane Id="b7889f37-f7c0-44a7-9c8b-a8162be04469" Description="Description for Company.Sequencer.ActorSwimLane" Name="ActorSwimLane" DisplayName="Actor Swim Lane" Namespace="Company.Sequencer" FixedTooltipText="Actor Swim Lane" HeaderFillColor="LightBlue" InitialWidth="0" InitialHeight="0" SeparatorThickness="0.01">
      <Decorators>
        <SwimLaneHasDecorators Position="InnerTopCenter" HorizontalOffset="0" VerticalOffset="0">
          <TextDecorator Name="ActorName" DisplayName="Actor Name" DefaultText="ActorName" />
        </SwimLaneHasDecorators>
      </Decorators>
    </SwimLane>
  </Shapes>
  <Connectors>
    <Connector Id="3e249c3d-00ef-4146-9382-fc1b4daa0859" Description="Description for Company.Sequencer.CommentConnector" Name="CommentConnector" DisplayName="Comment Connector" Namespace="Company.Sequencer" FixedTooltipText="Comment Connector" Color="113, 111, 110" DashStyle="Dot" Thickness="0.01" RoutingStyle="Straight" />
    <Connector Id="a93df324-bfc8-4902-9654-ca548e44aae9" Description="Description for Company.Sequencer.FlowConnector" Name="FlowConnector" DisplayName="Flow Connector" Namespace="Company.Sequencer" FixedTooltipText="Flow Connector" Color="113, 111, 110" TargetEndStyle="EmptyArrow" Thickness="0.01">
      <ConnectorHasDecorators Position="SourceTop" OffsetFromShape="0" OffsetFromLine="0">
        <TextDecorator Name="Guard" DisplayName="Guard" DefaultText="Guard" />
      </ConnectorHasDecorators>
    </Connector>
    <Connector Id="b5cc64e5-b488-4b4f-8083-ade3e548086c" Description="Description for Company.Sequencer.ObjectFlowConnector" Name="ObjectFlowConnector" DisplayName="Object Flow Connector" Namespace="Company.Sequencer" FixedTooltipText="Object Flow Connector" Color="113, 111, 110" DashStyle="Dash" TargetEndStyle="EmptyArrow" Thickness="0.01" />
  </Connectors>
  <XmlSerializationBehavior Name="SequencerSerializationBehavior" Namespace="Company.Sequencer">
    <ClassData>
      <XmlClassData TypeName="NamedElement" MonikerAttributeName="name" SerializeId="true" MonikerElementName="namedElementMoniker" ElementName="namedElement" MonikerTypeName="NamedElementMoniker">
        <DomainClassMoniker Name="NamedElement" />
        <ElementData>
          <XmlPropertyData XmlName="name" IsMonikerKey="true">
            <DomainPropertyMoniker Name="NamedElement/Name" />
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
      <XmlClassData TypeName="FlowGraphHasComments" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowGraphHasCommentsMoniker" ElementName="flowGraphHasComments" MonikerTypeName="FlowGraphHasCommentsMoniker">
        <DomainRelationshipMoniker Name="FlowGraphHasComments" />
      </XmlClassData>
      <XmlClassData TypeName="CommentReferencesSubjects" MonikerAttributeName="" SerializeId="true" MonikerElementName="commentReferencesSubjectsMoniker" ElementName="commentReferencesSubjects" MonikerTypeName="CommentReferencesSubjectsMoniker">
        <DomainRelationshipMoniker Name="CommentReferencesSubjects" />
      </XmlClassData>
      <XmlClassData TypeName="ObjectFlow" MonikerAttributeName="" SerializeId="true" MonikerElementName="objectFlowMoniker" ElementName="objectFlow" MonikerTypeName="ObjectFlowMoniker">
        <DomainRelationshipMoniker Name="ObjectFlow" />
      </XmlClassData>
      <XmlClassData TypeName="FlowGraph" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowGraphMoniker" ElementName="flowGraph" MonikerTypeName="FlowGraphMoniker">
        <DomainClassMoniker Name="FlowGraph" />
        <ElementData>
          <XmlRelationshipData RoleElementName="comments">
            <DomainRelationshipMoniker Name="FlowGraphHasComments" />
          </XmlRelationshipData>
          <XmlRelationshipData RoleElementName="actors">
            <DomainRelationshipMoniker Name="FlowGraphHasActors" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="FlowElement" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowElementMoniker" ElementName="flowElement" MonikerTypeName="FlowElementMoniker">
        <DomainClassMoniker Name="FlowElement" />
        <ElementData>
          <XmlPropertyData XmlName="description">
            <DomainPropertyMoniker Name="FlowElement/Description" />
          </XmlPropertyData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="flowTo">
            <DomainRelationshipMoniker Name="Flow" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="ObjectFlowElement" MonikerAttributeName="" SerializeId="true" MonikerElementName="objectFlowElementMoniker" ElementName="objectFlowElement" MonikerTypeName="ObjectFlowElementMoniker">
        <DomainClassMoniker Name="ObjectFlowElement" />
        <ElementData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="objectFlowFrom">
            <DomainRelationshipMoniker Name="ObjectFlow" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="Task" MonikerAttributeName="" SerializeId="true" MonikerElementName="taskMoniker" ElementName="task" MonikerTypeName="TaskMoniker">
        <DomainClassMoniker Name="Task" />
        <ElementData>
          <XmlPropertyData XmlName="sort">
            <DomainPropertyMoniker Name="Task/Sort" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="nestedDiagram">
            <DomainPropertyMoniker Name="Task/NestedDiagram" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="StartPoint" MonikerAttributeName="" SerializeId="true" MonikerElementName="startPointMoniker" ElementName="startPoint" MonikerTypeName="StartPointMoniker">
        <DomainClassMoniker Name="StartPoint" />
      </XmlClassData>
      <XmlClassData TypeName="Endpoint" MonikerAttributeName="" SerializeId="true" MonikerElementName="endpointMoniker" ElementName="endpoint" MonikerTypeName="EndpointMoniker">
        <DomainClassMoniker Name="Endpoint" />
      </XmlClassData>
      <XmlClassData TypeName="MergeBranch" MonikerAttributeName="" SerializeId="true" MonikerElementName="mergeBranchMoniker" ElementName="mergeBranch" MonikerTypeName="MergeBranchMoniker">
        <DomainClassMoniker Name="MergeBranch" />
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
      <XmlClassData TypeName="ObjectInState" MonikerAttributeName="" SerializeId="true" MonikerElementName="objectInStateMoniker" ElementName="objectInState" MonikerTypeName="ObjectInStateMoniker">
        <DomainClassMoniker Name="ObjectInState" />
        <ElementData>
          <XmlPropertyData XmlName="state">
            <DomainPropertyMoniker Name="ObjectInState/State" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="Actor" MonikerAttributeName="" SerializeId="true" MonikerElementName="actorMoniker" ElementName="actor" MonikerTypeName="ActorMoniker">
        <DomainClassMoniker Name="Actor" />
        <ElementData>
          <XmlRelationshipData RoleElementName="flowElements">
            <DomainRelationshipMoniker Name="ActorHasFlowElements" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="FlowGraphHasActors" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowGraphHasActorsMoniker" ElementName="flowGraphHasActors" MonikerTypeName="FlowGraphHasActorsMoniker">
        <DomainRelationshipMoniker Name="FlowGraphHasActors" />
      </XmlClassData>
      <XmlClassData TypeName="TaskShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="taskShapeMoniker" ElementName="taskShape" MonikerTypeName="TaskShapeMoniker">
        <GeometryShapeMoniker Name="TaskShape" />
      </XmlClassData>
      <XmlClassData TypeName="CommentBoxShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="commentBoxShapeMoniker" ElementName="commentBoxShape" MonikerTypeName="CommentBoxShapeMoniker">
        <GeometryShapeMoniker Name="CommentBoxShape" />
      </XmlClassData>
      <XmlClassData TypeName="MergeBranchShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="mergeBranchShapeMoniker" ElementName="mergeBranchShape" MonikerTypeName="MergeBranchShapeMoniker">
        <ImageShapeMoniker Name="MergeBranchShape" />
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
      <XmlClassData TypeName="ObjectShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="objectShapeMoniker" ElementName="objectShape" MonikerTypeName="ObjectShapeMoniker">
        <GeometryShapeMoniker Name="ObjectShape" />
      </XmlClassData>
      <XmlClassData TypeName="ActorSwimLane" MonikerAttributeName="" SerializeId="true" MonikerElementName="actorSwimLaneMoniker" ElementName="actorSwimLane" MonikerTypeName="ActorSwimLaneMoniker">
        <SwimLaneMoniker Name="ActorSwimLane" />
      </XmlClassData>
      <XmlClassData TypeName="CommentConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="commentConnectorMoniker" ElementName="commentConnector" MonikerTypeName="CommentConnectorMoniker">
        <ConnectorMoniker Name="CommentConnector" />
      </XmlClassData>
      <XmlClassData TypeName="FlowConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowConnectorMoniker" ElementName="flowConnector" MonikerTypeName="FlowConnectorMoniker">
        <ConnectorMoniker Name="FlowConnector" />
      </XmlClassData>
      <XmlClassData TypeName="ObjectFlowConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="objectFlowConnectorMoniker" ElementName="objectFlowConnector" MonikerTypeName="ObjectFlowConnectorMoniker">
        <ConnectorMoniker Name="ObjectFlowConnector" />
      </XmlClassData>
      <XmlClassData TypeName="SequencerDiagram" MonikerAttributeName="" SerializeId="true" MonikerElementName="sequencerDiagramMoniker" ElementName="sequencerDiagram" MonikerTypeName="SequencerDiagramMoniker">
        <DiagramMoniker Name="SequencerDiagram" />
      </XmlClassData>
      <XmlClassData TypeName="ActorHasFlowElements" MonikerAttributeName="" SerializeId="true" MonikerElementName="actorHasFlowElementsMoniker" ElementName="actorHasFlowElements" MonikerTypeName="ActorHasFlowElementsMoniker">
        <DomainRelationshipMoniker Name="ActorHasFlowElements" />
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
              <DomainClassMoniker Name="Task" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="MergeBranch" />
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
              <DomainClassMoniker Name="Task" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="MergeBranch" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Endpoint" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Synchronization" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </TargetDirectives>
      </LinkConnectDirective>
      <LinkConnectDirective>
        <Notes>Connections *to* an Object, from a Task or an Object.</Notes>
        <DomainRelationshipMoniker Name="ObjectFlow" />
        <SourceDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Task" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="ObjectInState" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </SourceDirectives>
        <TargetDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="ObjectInState" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </TargetDirectives>
      </LinkConnectDirective>
      <LinkConnectDirective>
        <Notes>Connections *from* an Object, to a Task. (Object to Object is covered by the other LinkConnectDirective.)</Notes>
        <DomainRelationshipMoniker Name="ObjectFlow" />
        <SourceDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="ObjectInState" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </SourceDirectives>
        <TargetDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Task" />
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
  <Diagram Id="b68e6c42-4eb9-46a7-af2d-9e43de461561" Description="Description for Company.Sequencer.SequencerDiagram" Name="SequencerDiagram" DisplayName="Flow Diagram" Namespace="Company.Sequencer">
    <Class>
      <DomainClassMoniker Name="FlowGraph" />
    </Class>
    <ShapeMaps>
      <ShapeMap>
        <DomainClassMoniker Name="Task" />
        <ParentElementPath>
          <DomainPath>ActorHasFlowElements.Actor/!Actor</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="TaskShape/Name" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="NamedElement/Name" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <DecoratorMap>
          <IconDecoratorMoniker Name="TaskShape/SubTask" />
          <VisibilityPropertyPath>
            <DomainPropertyMoniker Name="Task/Sort" />
            <PropertyFilters>
              <PropertyFilter FilteringValue="SuperTask" />
            </PropertyFilters>
          </VisibilityPropertyPath>
        </DecoratorMap>
        <GeometryShapeMoniker Name="TaskShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="Comment" />
        <ParentElementPath>
          <DomainPath>FlowGraphHasComments.FlowGraph/!FlowGraph</DomainPath>
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
        <DomainClassMoniker Name="MergeBranch" />
        <ParentElementPath>
          <DomainPath>ActorHasFlowElements.Actor/!Actor</DomainPath>
        </ParentElementPath>
        <ImageShapeMoniker Name="MergeBranchShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="Endpoint" />
        <ParentElementPath>
          <DomainPath>ActorHasFlowElements.Actor/!Actor</DomainPath>
        </ParentElementPath>
        <ImageShapeMoniker Name="EndShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="StartPoint" />
        <ParentElementPath>
          <DomainPath>ActorHasFlowElements.Actor/!Actor</DomainPath>
        </ParentElementPath>
        <ImageShapeMoniker Name="StartShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="Synchronization" />
        <ParentElementPath>
          <DomainPath>ActorHasFlowElements.Actor/!Actor</DomainPath>
        </ParentElementPath>
        <GeometryShapeMoniker Name="SyncBarShape" />
      </ShapeMap>
      <SwimLaneMap>
        <DomainClassMoniker Name="Actor" />
        <ParentElementPath>
          <DomainPath>FlowGraphHasActors.FlowGraph/!FlowGraph</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ActorSwimLane/ActorName" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="NamedElement/Name" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <SwimLane>
          <SwimLaneMoniker Name="ActorSwimLane" />
        </SwimLane>
      </SwimLaneMap>
      <ShapeMap>
        <DomainClassMoniker Name="ObjectInState" />
        <ParentElementPath>
          <DomainPath>ActorHasFlowElements.Actor/!Actor</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ObjectShape/Name" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="NamedElement/Name" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ObjectShape/State" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="ObjectInState/State" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="ObjectShape" />
      </ShapeMap>
    </ShapeMaps>
    <ConnectorMaps>
      <ConnectorMap>
        <ConnectorMoniker Name="FlowConnector" />
        <DomainRelationshipMoniker Name="Flow" />
        <DecoratorMap>
          <TextDecoratorMoniker Name="FlowConnector/Guard" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Flow/Guard" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
      </ConnectorMap>
      <ConnectorMap>
        <ConnectorMoniker Name="ObjectFlowConnector" />
        <DomainRelationshipMoniker Name="ObjectFlow" />
      </ConnectorMap>
      <ConnectorMap>
        <ConnectorMoniker Name="CommentConnector" />
        <DomainRelationshipMoniker Name="CommentReferencesSubjects" />
      </ConnectorMap>
    </ConnectorMaps>
  </Diagram>
  <Designer CopyPasteGeneration="CopyPasteOnly" FileExtension="sqc" EditorGuid="f293475e-75f9-456c-b012-d2274e3d4b87">
    <RootClass>
      <DomainClassMoniker Name="FlowGraph" />
    </RootClass>
    <XmlSerializationDefinition CustomPostLoad="false">
      <XmlSerializationBehaviorMoniker Name="SequencerSerializationBehavior" />
    </XmlSerializationDefinition>
    <ToolboxTab TabText="Sequencer">
      <ElementTool Name="Task" ToolboxIcon="resources\TaskTool.bmp" Caption="Task" Tooltip="Create a Task" HelpKeyword="CreateTaskF1Keyword">
        <DomainClassMoniker Name="Task" />
      </ElementTool>
      <ElementTool Name="StartPoint" ToolboxIcon="Resources\StartTool.bmp" Caption="Start Point" Tooltip="Create a Start Point" HelpKeyword="CreateStartStateF1Keyword">
        <DomainClassMoniker Name="StartPoint" />
      </ElementTool>
      <ElementTool Name="EndPoint" ToolboxIcon="Resources\EndTool.bmp" Caption="End Point" Tooltip="End Point" HelpKeyword="CreateFinalStateF1Keyword">
        <DomainClassMoniker Name="Endpoint" />
      </ElementTool>
      <ElementTool Name="MergeBranch" ToolboxIcon="resources\MergeBranchTool.bmp" Caption="Merge/Branch" Tooltip="Create a Merge/Branch" HelpKeyword="CreateMergeBranchF1Keyword">
        <DomainClassMoniker Name="MergeBranch" />
      </ElementTool>
      <ElementTool Name="Synchronization" ToolboxIcon="resources\SyncBarTool.bmp" Caption="Synchronization" Tooltip="Create a Synchronization bar" HelpKeyword="Synchronization">
        <DomainClassMoniker Name="Synchronization" />
      </ElementTool>
      <ConnectionTool Name="Flow" ToolboxIcon="resources\FlowTool.bmp" Caption="Flow" Tooltip="Drag between Tasks to create a Flow" HelpKeyword="ConnectFlowF1Keyword">
        <ConnectionBuilderMoniker Name="Sequencer/FlowBuilder" />
      </ConnectionTool>
      <ElementTool Name="ObjectInState" ToolboxIcon="resources\ObjectTool.bmp" Caption="Object In State" Tooltip="Create an Object-In-State" HelpKeyword="CreateObjectInStateF1Keyword">
        <DomainClassMoniker Name="ObjectInState" />
      </ElementTool>
      <ElementTool Name="Comment" ToolboxIcon="resources\CommentTool.bmp" Caption="Comment" Tooltip="Create a Comment" HelpKeyword="CreateCommentF1Keyword">
        <DomainClassMoniker Name="Comment" />
      </ElementTool>
      <ConnectionTool Name="CommentSubjects" ToolboxIcon="resources\CommentConnectorTool.bmp" Caption="Comment Connector" Tooltip="Drag to link a Comment to its subjects" HelpKeyword="ConnectCommentSubjectsF1Keyword">
        <ConnectionBuilderMoniker Name="Sequencer/CommentReferencesSubjectsBuilder" />
      </ConnectionTool>
      <ElementTool Name="Actor" ToolboxIcon="resources\SwimlaneTool.bmp" Caption="Actor swim lane" Tooltip="Create an Actor Swim Lane" HelpKeyword="Actor">
        <DomainClassMoniker Name="Actor" />
      </ElementTool>
    </ToolboxTab>
    <Validation UsesMenu="false" UsesOpen="false" UsesSave="false" UsesLoad="false" />
    <DiagramMoniker Name="SequencerDiagram" />
  </Designer>
  <Explorer ExplorerGuid="90838454-181a-432c-9005-d15b9a32a72c" Title="Sequencer Explorer">
    <ExplorerBehaviorMoniker Name="Sequencer/SequencerExplorer" />
  </Explorer>
</Dsl>